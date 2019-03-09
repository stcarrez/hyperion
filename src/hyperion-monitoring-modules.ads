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
with Ada.Calendar;
with Ada.Containers.Hashed_Maps;
with Ada.Containers.Indefinite_Hashed_Maps;

with Util.Beans.Objects.Vectors;
with Util.Texts.Builders;
with ASF.Applications;

with ADO.Utils;
with ADO.Sessions;
with AWA.Modules;
with Hyperion.Hosts.Models;
with Hyperion.Monitoring.Models;
package Hyperion.Monitoring.Modules is

   --  The name under which the module is registered.
   NAME : constant String := "monitoring";

   --  ------------------------------
   --  Module monitoring
   --  ------------------------------
   type Monitoring_Module is new AWA.Modules.Module with private;
   type Monitoring_Module_Access is access all Monitoring_Module'Class;

   --  Initialize the monitoring module.
   overriding
   procedure Initialize (Plugin : in out Monitoring_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config);

   --  Get the monitoring module.
   function Get_Monitoring_Module return Monitoring_Module_Access;

private

   package UBO renames Util.Beans.Objects;

   --  The Host_Source_Key is a key that uniquely identifes a source for a given host.
   type Host_Source_Key (Len : Natural) is record
      Host : ADO.Identifier := ADO.NO_IDENTIFIER;
      Name : String (1 .. Len);
   end record;

   --  Create a hash value for the host-source key.
   function Hash (Key : in Host_Source_Key) return Ada.Containers.Hash_Type;

   subtype Value_Type is Long_Long_Integer;
   type Value_Array is array (Positive range <>) of Value_Type;

   package Value_Builders is
     new Util.Texts.Builders (Element_Type => Value_Type,
                              Input        => Value_Array,
                              Chunk_Size   => 256);

   protected type Snapshot_Data is

      procedure Collect (DB     : in out ADO.Sessions.Master_Session;
                         From   : in Ada.Calendar.Time;
                         To     : in Ada.Calendar.Time;
                         Values : in UBO.Vectors.Vector_Bean);

   private
      Source     : Hyperion.Monitoring.Models.Source_Ref;
      Start_Time : Ada.Calendar.Time;
      End_Time   : Ada.Calendar.Time;
      Serie      : Hyperion.Monitoring.Models.Series_Ref;
      Data       : Value_Builders.Builder (Len => 256);
   end Snapshot_Data;
   type Snapshot_Data_Access is access all Snapshot_Data;

   package Source_Snapshot_Maps is
     new Ada.Containers.Hashed_Maps (Key_Type        => ADO.Identifier,
                                     Element_Type    => Snapshot_Data_Access,
                                     Hash            => ADO.Utils.Hash,
                                     Equivalent_Keys => ADO."=",
                                     "="             => "=");

   package Host_Source_Maps is
     new Ada.Containers.Indefinite_Hashed_Maps (Key_Type        => Host_Source_Key,
                                                Element_Type    => ADO.Identifier,
                                                Hash            => Hash,
                                                Equivalent_Keys => "=",
                                                "="             => ADO."=");

   protected type All_Snapshots is

      procedure Host_Snapshot (Host_Id  : in ADO.Identifier;
                               Name     : in String;
                               Snapshot : out Snapshot_Data_Access);

   private
      Source_Map : Host_Source_Maps.Map;
      Snapshots  : Source_Snapshot_Maps.Map;
   end All_Snapshots;

   type Monitoring_Module is new AWA.Modules.Module with record
      Snapshots : All_Snapshots;
   end record;

end Hyperion.Monitoring.Modules;
