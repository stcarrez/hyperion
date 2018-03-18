-----------------------------------------------------------------------
--  Hyperion.Agents.Models -- Hyperion.Agents.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
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
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
package body Hyperion.Agents.Models is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;
   use type ADO.Objects.Object_Record;

   pragma Warnings (Off, "formal parameter * is not referenced");

   function Agent_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => AGENT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Agent_Key;

   function Agent_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => AGENT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Agent_Key;

   function "=" (Left, Right : Agent_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Agent_Ref'Class;
                        Impl   : out Agent_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Agent_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Agent_Ref) is
      Impl : Agent_Access;
   begin
      Impl := new Agent_Impl;
      Impl.Create_Date := ADO.DEFAULT_TIME;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Agent
   -- ----------------------------------------

   procedure Set_Id (Object : in out Agent_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Agent_Ref)
                  return ADO.Identifier is
      Impl : constant Agent_Access
         := Agent_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   procedure Set_Hostname (Object : in out Agent_Ref;
                            Value : in String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 2, Impl.Hostname, Value);
   end Set_Hostname;

   procedure Set_Hostname (Object : in out Agent_Ref;
                           Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 2, Impl.Hostname, Value);
   end Set_Hostname;

   function Get_Hostname (Object : in Agent_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Hostname);
   end Get_Hostname;
   function Get_Hostname (Object : in Agent_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Agent_Access
         := Agent_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Hostname;
   end Get_Hostname;


   procedure Set_Ip (Object : in out Agent_Ref;
                      Value : in String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Ip, Value);
   end Set_Ip;

   procedure Set_Ip (Object : in out Agent_Ref;
                     Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 3, Impl.Ip, Value);
   end Set_Ip;

   function Get_Ip (Object : in Agent_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Ip);
   end Get_Ip;
   function Get_Ip (Object : in Agent_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Agent_Access
         := Agent_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Ip;
   end Get_Ip;


   procedure Set_Key (Object : in out Agent_Ref;
                       Value : in String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.Key, Value);
   end Set_Key;

   procedure Set_Key (Object : in out Agent_Ref;
                      Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 4, Impl.Key, Value);
   end Set_Key;

   function Get_Key (Object : in Agent_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Key);
   end Get_Key;
   function Get_Key (Object : in Agent_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Agent_Access
         := Agent_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Key;
   end Get_Key;


   procedure Set_Create_Date (Object : in out Agent_Ref;
                              Value  : in Ada.Calendar.Time) is
      Impl : Agent_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 5, Impl.Create_Date, Value);
   end Set_Create_Date;

   function Get_Create_Date (Object : in Agent_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Agent_Access
         := Agent_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Create_Date;
   end Get_Create_Date;

   --  Copy of the object.
   procedure Copy (Object : in Agent_Ref;
                   Into   : in out Agent_Ref) is
      Result : Agent_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Agent_Access
              := Agent_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Agent_Access
              := new Agent_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Hostname := Impl.Hostname;
            Copy.Ip := Impl.Ip;
            Copy.Key := Impl.Key;
            Copy.Create_Date := Impl.Create_Date;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Agent_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Agent_Access := new Agent_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Agent_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Agent_Access := new Agent_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Agent_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Agent_Access := new Agent_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Save (Object  : in out Agent_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Agent_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Agent_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access Agent_Impl) is
      type Agent_Impl_Ptr is access all Agent_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Agent_Impl, Agent_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Agent_Impl_Ptr := Agent_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Agent_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, AGENT_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Agent_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   procedure Save (Object  : in out Agent_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (AGENT_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (2) then
         Stmt.Save_Field (Name  => COL_1_1_NAME, --  hostname
                          Value => Object.Hostname);
         Object.Clear_Modified (2);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  ip
                          Value => Object.Ip);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  key
                          Value => Object.Key);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_1_NAME, --  create_date
                          Value => Object.Create_Date);
         Object.Clear_Modified (5);
      end if;
      if Stmt.Has_Save_Fields then
         Stmt.Set_Filter (Filter => "id = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Agent_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (AGENT_DEF'Access);
      Result : Integer;
   begin
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  hostname
                        Value => Object.Hostname);
      Query.Save_Field (Name  => COL_2_1_NAME, --  ip
                        Value => Object.Ip);
      Query.Save_Field (Name  => COL_3_1_NAME, --  key
                        Value => Object.Key);
      Query.Save_Field (Name  => COL_4_1_NAME, --  create_date
                        Value => Object.Create_Date);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Agent_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (AGENT_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Agent_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : ADO.Objects.Object_Record_Access;
      Impl : access Agent_Impl;
   begin
      if From.Is_Null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Obj := From.Get_Load_Object;
      Impl := Agent_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "hostname" then
         return Util.Beans.Objects.To_Object (Impl.Hostname);
      elsif Name = "ip" then
         return Util.Beans.Objects.To_Object (Impl.Ip);
      elsif Name = "key" then
         return Util.Beans.Objects.To_Object (Impl.Key);
      elsif Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Create_Date);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   procedure List (Object  : in out Agent_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, AGENT_DEF'Access);
   begin
      Stmt.Execute;
      Agent_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Agent_Ref;
            Impl : constant Agent_Access := new Agent_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Agent_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
      pragma Unreferenced (Session);
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Hostname := Stmt.Get_Unbounded_String (1);
      Object.Ip := Stmt.Get_Unbounded_String (2);
      Object.Key := Stmt.Get_Unbounded_String (3);
      Object.Create_Date := Stmt.Get_Time (4);
      ADO.Objects.Set_Created (Object);
   end Load;


end Hyperion.Agents.Models;
