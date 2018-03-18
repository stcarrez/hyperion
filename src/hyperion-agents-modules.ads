-----------------------------------------------------------------------
--  hyperion-agents-modules -- Module agents
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
with ASF.Applications;

with AWA.Modules;
package Hyperion.Agents.Modules is

   --  The name under which the module is registered.
   NAME : constant String := "agents";

   --  ------------------------------
   --  Module agents
   --  ------------------------------
   type Agent_Module is new AWA.Modules.Module with private;
   type Agent_Module_Access is access all Agent_Module'Class;

   --  Initialize the agents module.
   overriding
   procedure Initialize (Plugin : in out Agent_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config);

   --  Get the agents module.
   function Get_Agent_Module return Agent_Module_Access;

private

   type Agent_Module is new AWA.Modules.Module with null record;

end Hyperion.Agents.Modules;
