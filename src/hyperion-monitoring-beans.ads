-----------------------------------------------------------------------
--  hyperion-monitoring-beans -- Beans for module monitoring
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

with Ada.Strings.Unbounded;

with Util.Beans.Basic;
with Util.Beans.Objects;
with Util.Beans.Methods;
with Hyperion.Monitoring.Modules;
package Hyperion.Monitoring.Beans is

   type Monitoring_Bean is new Util.Beans.Basic.Bean
     and Util.Beans.Methods.Method_Bean with record
      Module : Hyperion.Monitoring.Modules.Monitoring_Module_Access := null;
      Count  : Natural := 0;
   end record;
   type Monitoring_Bean_Access is access all Monitoring_Bean'Class;

   --  Get the value identified by the name.
   overriding
   function Get_Value (From : in Monitoring_Bean;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Set the value identified by the name.
   overriding
   procedure Set_Value (From  : in out Monitoring_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object);

   --  This bean provides some methods that can be used in a Method_Expression
   overriding
   function Get_Method_Bindings (From : in Monitoring_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access;

   --  Example of action method.
   procedure Action (Bean    : in out Monitoring_Bean;
                     Outcome : in out Ada.Strings.Unbounded.Unbounded_String);

   --  Create the Monitoring_Bean bean instance.
   function Create_Monitoring_Bean (Module : in Hyperion.Monitoring.Modules.Monitoring_Module_Access)
      return Util.Beans.Basic.Readonly_Bean_Access;

end Hyperion.Monitoring.Beans;
