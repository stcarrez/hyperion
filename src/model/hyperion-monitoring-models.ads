-----------------------------------------------------------------------
--  Hyperion.Monitoring.Models -- Hyperion.Monitoring.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2017 Stephane Carrez
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
pragma Warnings (Off);
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with Ada.Calendar;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
with Hyperion.Hosts.Models;
pragma Warnings (On);
package Hyperion.Monitoring.Models is

   pragma Style_Checks ("-mr");

   type Snapshot_Ref is new ADO.Objects.Object_Ref with null record;

   type Source_Ref is new ADO.Objects.Object_Ref with null record;

   type Series_Ref is new ADO.Objects.Object_Ref with null record;

   --  Create an object key for Snapshot.
   function Snapshot_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Snapshot from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Snapshot_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Snapshot : constant Snapshot_Ref;
   function "=" (Left, Right : Snapshot_Ref'Class) return Boolean;

   --  Set the snapshot identifier
   procedure Set_Id (Object : in out Snapshot_Ref;
                     Value  : in ADO.Identifier);

   --  Get the snapshot identifier
   function Get_Id (Object : in Snapshot_Ref)
                 return ADO.Identifier;

   --  Set the snapshot date
   procedure Set_Start_Date (Object : in out Snapshot_Ref;
                             Value  : in Ada.Calendar.Time);

   --  Get the snapshot date
   function Get_Start_Date (Object : in Snapshot_Ref)
                 return Ada.Calendar.Time;

   --  Set the snapshot end date.
   procedure Set_End_Date (Object : in out Snapshot_Ref;
                           Value  : in Ada.Calendar.Time);

   --  Get the snapshot end date.
   function Get_End_Date (Object : in Snapshot_Ref)
                 return Ada.Calendar.Time;
   --  Get the optimistic lock version
   function Get_Version (Object : in Snapshot_Ref)
                 return Integer;

   --  Set the host to which the snapshot is associated
   procedure Set_Host (Object : in out Snapshot_Ref;
                       Value  : in Hyperion.Hosts.Models.Host_Ref'Class);

   --  Get the host to which the snapshot is associated
   function Get_Host (Object : in Snapshot_Ref)
                 return Hyperion.Hosts.Models.Host_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Snapshot_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Snapshot_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Snapshot_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Snapshot_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Snapshot_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Snapshot_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   SNAPSHOT_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Snapshot_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Snapshot_Ref;
                   Into   : in out Snapshot_Ref);

   package Snapshot_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Snapshot_Ref,
                                  "="          => "=");
   subtype Snapshot_Vector is Snapshot_Vectors.Vector;

   procedure List (Object  : in out Snapshot_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  Create an object key for Source.
   function Source_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Source from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Source_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Source : constant Source_Ref;
   function "=" (Left, Right : Source_Ref'Class) return Boolean;

   --  Set unique identifier.
   procedure Set_Id (Object : in out Source_Ref;
                     Value  : in ADO.Identifier);

   --  Get unique identifier.
   function Get_Id (Object : in Source_Ref)
                 return ADO.Identifier;

   --  Set the time series name.
   procedure Set_Name (Object : in out Source_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Source_Ref;
                       Value : in String);

   --  Get the time series name.
   function Get_Name (Object : in Source_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Source_Ref)
                 return String;

   --  Set the label to be used in presentation.
   procedure Set_Label (Object : in out Source_Ref;
                        Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Label (Object : in out Source_Ref;
                        Value : in String);

   --  Get the label to be used in presentation.
   function Get_Label (Object : in Source_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Label (Object : in Source_Ref)
                 return String;
   --  Get the optimistic lock version
   function Get_Version (Object : in Source_Ref)
                 return Integer;

   --  Set the host to which the source is associated
   procedure Set_Host (Object : in out Source_Ref;
                       Value  : in Hyperion.Hosts.Models.Host_Ref'Class);

   --  Get the host to which the source is associated
   function Get_Host (Object : in Source_Ref)
                 return Hyperion.Hosts.Models.Host_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Source_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Source_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Source_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Source_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Source_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Source_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   SOURCE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Source_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Source_Ref;
                   Into   : in out Source_Ref);

   package Source_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Source_Ref,
                                  "="          => "=");
   subtype Source_Vector is Source_Vectors.Vector;

   procedure List (Object  : in out Source_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  Create an object key for Series.
   function Series_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Series from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Series_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Series : constant Series_Ref;
   function "=" (Left, Right : Series_Ref'Class) return Boolean;

   --  Set the series unique identifier
   procedure Set_Id (Object : in out Series_Ref;
                     Value  : in ADO.Identifier);

   --  Get the series unique identifier
   function Get_Id (Object : in Series_Ref)
                 return ADO.Identifier;
   --  Get the optimistic lock version.
   function Get_Version (Object : in Series_Ref)
                 return Integer;

   --  Set the date and time of the first value in the series.
   procedure Set_Start_Date (Object : in out Series_Ref;
                             Value  : in Ada.Calendar.Time);

   --  Get the date and time of the first value in the series.
   function Get_Start_Date (Object : in Series_Ref)
                 return Ada.Calendar.Time;

   --  Set the date and time of the last value in the series.
   procedure Set_End_Date (Object : in out Series_Ref;
                           Value  : in Ada.Calendar.Time);

   --  Get the date and time of the last value in the series.
   function Get_End_Date (Object : in Series_Ref)
                 return Ada.Calendar.Time;

   --  Set the series content (JSON).
   procedure Set_Content (Object : in out Series_Ref;
                          Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Content (Object : in out Series_Ref;
                          Value : in String);

   --  Get the series content (JSON).
   function Get_Content (Object : in Series_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Content (Object : in Series_Ref)
                 return String;

   --  Set the number of values in the series.
   procedure Set_Count (Object : in out Series_Ref;
                        Value  : in Integer);

   --  Get the number of values in the series.
   function Get_Count (Object : in Series_Ref)
                 return Integer;

   --
   procedure Set_Source (Object : in out Series_Ref;
                         Value  : in Hyperion.Monitoring.Models.Source_Ref'Class);

   --
   function Get_Source (Object : in Series_Ref)
                 return Hyperion.Monitoring.Models.Source_Ref'Class;

   --  Set the snapshot that produced the series
   procedure Set_Snapshot (Object : in out Series_Ref;
                           Value  : in Hyperion.Monitoring.Models.Snapshot_Ref'Class);

   --  Get the snapshot that produced the series
   function Get_Snapshot (Object : in Series_Ref)
                 return Hyperion.Monitoring.Models.Snapshot_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Series_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Series_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Series_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Series_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Series_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Series_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   SERIES_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Series_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Series_Ref;
                   Into   : in out Series_Ref);




private
   SNAPSHOT_NAME : aliased constant String := "hyperion_snapshot";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "start_date";
   COL_2_1_NAME : aliased constant String := "end_date";
   COL_3_1_NAME : aliased constant String := "version";
   COL_4_1_NAME : aliased constant String := "host_id";

   SNAPSHOT_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 5,
      Table => SNAPSHOT_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access,
         4 => COL_3_1_NAME'Access,
         5 => COL_4_1_NAME'Access
)
     );
   SNAPSHOT_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := SNAPSHOT_DEF'Access;

   Null_Snapshot : constant Snapshot_Ref
      := Snapshot_Ref'(ADO.Objects.Object_Ref with null record);

   type Snapshot_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => SNAPSHOT_DEF'Access)
   with record
       Start_Date : Ada.Calendar.Time;
       End_Date : Ada.Calendar.Time;
       Version : Integer;
       Host : Hyperion.Hosts.Models.Host_Ref;
   end record;

   type Snapshot_Access is access all Snapshot_Impl;

   overriding
   procedure Destroy (Object : access Snapshot_Impl);

   overriding
   procedure Find (Object  : in out Snapshot_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Snapshot_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Snapshot_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Snapshot_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Snapshot_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Snapshot_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Snapshot_Ref'Class;
                        Impl   : out Snapshot_Access);
   SOURCE_NAME : aliased constant String := "hyperion_source";
   COL_0_2_NAME : aliased constant String := "id";
   COL_1_2_NAME : aliased constant String := "name";
   COL_2_2_NAME : aliased constant String := "label";
   COL_3_2_NAME : aliased constant String := "version";
   COL_4_2_NAME : aliased constant String := "host_id";

   SOURCE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 5,
      Table => SOURCE_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access,
         4 => COL_3_2_NAME'Access,
         5 => COL_4_2_NAME'Access
)
     );
   SOURCE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := SOURCE_DEF'Access;

   Null_Source : constant Source_Ref
      := Source_Ref'(ADO.Objects.Object_Ref with null record);

   type Source_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => SOURCE_DEF'Access)
   with record
       Name : Ada.Strings.Unbounded.Unbounded_String;
       Label : Ada.Strings.Unbounded.Unbounded_String;
       Version : Integer;
       Host : Hyperion.Hosts.Models.Host_Ref;
   end record;

   type Source_Access is access all Source_Impl;

   overriding
   procedure Destroy (Object : access Source_Impl);

   overriding
   procedure Find (Object  : in out Source_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Source_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Source_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Source_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Source_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Source_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Source_Ref'Class;
                        Impl   : out Source_Access);
   SERIES_NAME : aliased constant String := "hyperion_series";
   COL_0_3_NAME : aliased constant String := "id";
   COL_1_3_NAME : aliased constant String := "version";
   COL_2_3_NAME : aliased constant String := "start_date";
   COL_3_3_NAME : aliased constant String := "end_date";
   COL_4_3_NAME : aliased constant String := "content";
   COL_5_3_NAME : aliased constant String := "count";
   COL_6_3_NAME : aliased constant String := "source_id";
   COL_7_3_NAME : aliased constant String := "snapshot_id";

   SERIES_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 8,
      Table => SERIES_NAME'Access,
      Members => (
         1 => COL_0_3_NAME'Access,
         2 => COL_1_3_NAME'Access,
         3 => COL_2_3_NAME'Access,
         4 => COL_3_3_NAME'Access,
         5 => COL_4_3_NAME'Access,
         6 => COL_5_3_NAME'Access,
         7 => COL_6_3_NAME'Access,
         8 => COL_7_3_NAME'Access
)
     );
   SERIES_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := SERIES_DEF'Access;

   Null_Series : constant Series_Ref
      := Series_Ref'(ADO.Objects.Object_Ref with null record);

   type Series_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => SERIES_DEF'Access)
   with record
       Version : Integer;
       Start_Date : Ada.Calendar.Time;
       End_Date : Ada.Calendar.Time;
       Content : Ada.Strings.Unbounded.Unbounded_String;
       Count : Integer;
       Source : Hyperion.Monitoring.Models.Source_Ref;
       Snapshot : Hyperion.Monitoring.Models.Snapshot_Ref;
   end record;

   type Series_Access is access all Series_Impl;

   overriding
   procedure Destroy (Object : access Series_Impl);

   overriding
   procedure Find (Object  : in out Series_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Series_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Series_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Series_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Series_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Series_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Series_Ref'Class;
                        Impl   : out Series_Access);
end Hyperion.Monitoring.Models;
