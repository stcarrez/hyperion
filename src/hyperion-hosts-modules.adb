-----------------------------------------------------------------------
--  hyperion-hosts-modules -- Module hosts
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
with Ada.Calendar;

with ADO.Objects;
with ADO.Queries;
with ADO.Sessions;
with AWA.Services.Contexts;
with AWA.Modules.Beans;
with AWA.Modules.Get;
with Util.Log.Loggers;
with Hyperion.Hosts.Beans;
with Hyperion.Agents.Models;
package body Hyperion.Hosts.Modules is

   package ASC renames AWA.Services.Contexts;

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion.Hosts.Module");

   package Register is new AWA.Modules.Beans (Module => Host_Module,
                                              Module_Access => Host_Module_Access);

   --  ------------------------------
   --  Initialize the hosts module.
   --  ------------------------------
   overriding
   procedure Initialize (Plugin : in out Host_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config) is
   begin
      Log.Info ("Initializing the hosts module");

      --  Register here any bean class, servlet, filter.
      Register.Register (Plugin => Plugin,
                         Name   => "Hyperion.Hosts.Beans.Hosts_Bean",
                         Handler => Hyperion.Hosts.Beans.Create_Host_Bean'Access);

      AWA.Modules.Module (Plugin).Initialize (App, Props);

      --  Add here the creation of manager instances.
   end Initialize;

   --  ------------------------------
   --  Create a new host under the name, ip and associated with the agent.
   --  Return the host identifier.
   --  ------------------------------
   procedure Create_Host (Plugin    : in out Host_Module;
                          Agent_Key : in String;
                          Host      : in out Models.Host_Ref) is
      Ctx   : constant ASC.Service_Context_Access := ASC.Current;
      DB    : ADO.Sessions.Master_Session := ASC.Get_Master_Session (Ctx);
      Agent : Agents.Models.Agent_Ref;
      Found : Boolean;
      Query : ADO.Queries.Context;
   begin
      Ctx.Start;
      Query.Set_Filter ("o.key = :key");
      Query.Bind_Param ("key", Agent_Key);
      Agent.Find (DB, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND with "No agent with the given key";
      end if;
      Host.Set_Agent (Agent);
      Host.Set_Create_Date (Ada.Calendar.Clock);
      Host.Save (DB);
      Ctx.Commit;

      Log.Info ("Create host {0}@{1} under {2}",
                String '(Host.Get_Name),
                String '(Host.Get_Ip), ADO.Identifier'Image (Host.Get_Id));
   end Create_Host;

   --  ------------------------------
   --  Get the hosts module.
   --  ------------------------------
   function Get_Host_Module return Host_Module_Access is
      function Get is new AWA.Modules.Get (Host_Module, Host_Module_Access, NAME);
   begin
      return Get;
   end Get_Host_Module;

end Hyperion.Hosts.Modules;
