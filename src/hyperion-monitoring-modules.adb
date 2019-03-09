-----------------------------------------------------------------------
--  hyperion-monitoring-modules -- Module monitoring
--  Copyright (C) 2018 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
with Ada.Strings.Hash;
with AWA.Modules.Beans;
with AWA.Modules.Get;
with ADO.Utils.Streams;
with Util.Streams.Texts;
with Util.Log.Loggers;
with Util.Serialize.IO.JSON;
with Hyperion.Monitoring.Beans;
package body Hyperion.Monitoring.Modules is

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion.Monitoring.Module");

   package Register is new AWA.Modules.Beans (Module => Monitoring_Module,
                                              Module_Access => Monitoring_Module_Access);

   --  ------------------------------
   --  Initialize the monitoring module.
   --  ------------------------------
   overriding
   procedure Initialize (Plugin : in out Monitoring_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config) is
   begin
      Log.Info ("Initializing the monitoring module");

      --  Register here any bean class, servlet, filter.
      Register.Register (Plugin => Plugin,
                         Name   => "Hyperion.Monitoring.Beans.Monitoring_Bean",
                         Handler => Hyperion.Monitoring.Beans.Create_Monitoring_Bean'Access);

      AWA.Modules.Module (Plugin).Initialize (App, Props);

      --  Add here the creation of manager instances.
   end Initialize;

   --  ------------------------------
   --  Get the monitoring module.
   --  ------------------------------
   function Get_Monitoring_Module return Monitoring_Module_Access is
      function Get is new AWA.Modules.Get (Monitoring_Module, Monitoring_Module_Access, NAME);
   begin
      return Get;
   end Get_Monitoring_Module;

   --  ------------------------------
   --  Create a hash value for the host-source key.
   --  ------------------------------
   function Hash (Key : in Host_Source_Key) return Ada.Containers.Hash_Type is
      use type Ada.Containers.Hash_Type;
   begin
      return ADO.Utils.Hash (Key.Host) xor Ada.Strings.Hash (Key.Name);
   end Hash;

   protected body All_Snapshots is

      procedure Host_Snapshot (Host_Id  : in ADO.Identifier;
                               Name     : in String;
                               Snapshot : out Snapshot_Data_Access) is
         Key        : constant Host_Source_Key := Host_Source_Key '(Len  => Name'Length,
                                                                    Host => Host_Id,
                                                                    Name => Name);
         Source_Pos : constant Host_Source_Maps.Cursor := Source_Map.Find (Key);
         Pos        : Source_Snapshot_Maps.Cursor;
      begin
         if not Host_Source_Maps.Has_Element (Source_Pos) then
            --  Create
            null;
         end if;
         Pos := Snapshots.Find (Host_Source_Maps.Element (Source_Pos));
         Snapshot := Source_Snapshot_Maps.Element (Pos);
      end Host_Snapshot;

   end All_Snapshots;

   function Serialize (Data : in Value_Builders.Builder) return ADO.Blob_Ref is
      Stream  : aliased ADO.Utils.Streams.Blob_Output_Stream;
      Printer : aliased Util.Streams.Texts.Print_Stream;
      Json    : Util.Serialize.IO.JSON.Output_Stream;

      procedure Serialize_Values (Content : in Value_Array) is
      begin
         for V of Content loop
            Json.Write_Long_Entity ("", V);
         end loop;
      end Serialize_Values;

   begin
      Stream.Initialize (Size => 100000);
      Printer.Initialize (Output => Stream'Unchecked_Access,
                          Size   => 100000);
      Json.Initialize (Printer'Unchecked_Access);
      Json.Start_Document;
      Json.Start_Array ("");
      Value_Builders.Iterate (Data, Serialize_Values'Access);
      Json.End_Array ("");
      Json.End_Document;
      Json.Flush;
      return Stream.Get_Blob;
   end Serialize;

   protected body Snapshot_Data is

      procedure Collect (DB     : in out ADO.Sessions.Master_Session;
                         From   : in Ada.Calendar.Time;
                         To     : in Ada.Calendar.Time;
                         Values : in UBO.Vectors.Vector_Bean) is
      begin
         for V of Values loop
            Value_Builders.Append (Data, UBO.To_Long_Long_Integer (V));
         end loop;
         End_Time := To;
         Serie.Set_Start_Date (Start_Time);
         Serie.Set_End_Date (End_Time);
         Serie.Set_Content (Serialize (Data));
         Serie.Set_Count (Value_Builders.Length (Data));
         Serie.Set_Format (Hyperion.Monitoring.Models.FORMAT_JSON);
         Serie.Save (DB);
      end Collect;

   end Snapshot_Data;

end Hyperion.Monitoring.Modules;
