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
with Ada.Calendar;
with ADO.Sessions;
with AWA.Modules.Beans;
with AWA.Modules.Get;
with AWA.Services.Contexts;
with Util.Log.Loggers;
with Hyperion.Agents.Beans;
with Hyperion.Agents.Models;
package body Hyperion.Agents.Modules is

   package ASC renames AWA.Services.Contexts;

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion.Agents.Module");

   package Register is new AWA.Modules.Beans (Module => Agent_Module,
                                              Module_Access => Agent_Module_Access);

   --  ------------------------------
   --  Initialize the agents module.
   --  ------------------------------
   overriding
   procedure Initialize (Plugin : in out Agent_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config) is
   begin
      Log.Info ("Initializing the agents module");

      --  Register here any bean class, servlet, filter.
      Register.Register (Plugin => Plugin,
                         Name   => "Hyperion.Agents.Beans.Agents_Bean",
                         Handler => Hyperion.Agents.Beans.Create_Agent_Bean'Access);

      AWA.Modules.Module (Plugin).Initialize (App, Props);

      --  Add here the creation of manager instances.
   end Initialize;

   --  ------------------------------
   --  Register a new agent under the name, ip and key.
   --  Return the agent identifier.
   --  ------------------------------
   procedure Register_Agent (Plugin : in out Agent_Module;
                             Agent  : in out Models.Agent_Ref) is
      Ctx   : constant ASC.Service_Context_Access := ASC.Current;
      DB    : ADO.Sessions.Master_Session := ASC.Get_Master_Session (Ctx);
   begin
      Ctx.Start;
      Agent.Set_Create_Date (Ada.Calendar.Clock);
      Agent.Save (DB);
      Ctx.Commit;

      Log.Info ("Register agent {0}@{1} under {2}",
                String '(Agent.Get_Hostname),
                String '(Agent.Get_Ip), ADO.Identifier'Image (Agent.Get_Id));
   end Register_Agent;

   --  ------------------------------
   --  Get the agents module.
   --  ------------------------------
   function Get_Agent_Module return Agent_Module_Access is
      function Get is new AWA.Modules.Get (Agent_Module, Agent_Module_Access, NAME);
   begin
      return Get;
   end Get_Agent_Module;

end Hyperion.Agents.Modules;
