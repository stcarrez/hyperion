-----------------------------------------------------------------------
--  hyperion -- hyperion applications
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

with Util.Log.Loggers;
with Util.Properties;

with ASF.Applications.Main;

with AWA.Applications.Factory;
with Hyperion.Rest.Servers;
package body Hyperion.Applications is

   use AWA.Applications;

   Log     : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion");

   --  ------------------------------
   --  Initialize the application:
   --  <ul>
   --     <li>Register the servlets and filters.
   --     <li>Register the application modules.
   --     <li>Define the servlet and filter mappings.
   --  </ul>
   --  ------------------------------
   procedure Initialize (App    : in Application_Access;
                         Config : in ASF.Applications.Config) is
      Fact  : AWA.Applications.Factory.Application_Factory;
   begin
      App.Self := App;
      App.Initialize (Config, Fact);
      App.Set_Global ("contextPath", CONTEXT_PATH);

      --  Configure the authorization manager.
      App.Api_Auth.Set_Application_Manager (App.Apps'Unchecked_Access);
      App.Api_Auth.Set_Realm_Manager (App.Realm'Unchecked_Access);
      App.OAuth.Set_Auth_Manager (App.Api_Auth'Unchecked_Access);
      App.Api_Filter.Set_Auth_Manager (App.Api_Auth'Unchecked_Access);
      App.Realm.Load (Config, Config.Get ("swagger.users", "users"));
      App.Apps.Load (Config, Config.Get ("swagger.apps", "apps"));

      --  Register the REST API.
      Hyperion.Rest.Servers.Server_Impl.Register (App.all);
   end Initialize;

   --  ------------------------------
   --  Initialize the application configuration properties.  Properties defined in <b>Conf</b>
   --  are expanded by using the EL expression resolver.
   --  ------------------------------
   overriding
   procedure Initialize_Config (App  : in out Application;
                                Conf : in out ASF.Applications.Config) is
   begin
      AWA.Applications.Application (App).Initialize_Config (Conf);
      App.Apps.Load (Conf, Conf.Get ("swagger.apps", "apps"));
      App.Api_Auth.Set_Private_Key (Conf.Get ("swagger.key"));
   end Initialize_Config;

   --  ------------------------------
   --  Initialize the servlets provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application servlets.
   --  ------------------------------
   overriding
   procedure Initialize_Servlets (App : in out Application) is
   begin
      Log.Info ("Initializing application servlets...");

      AWA.Applications.Application (App).Initialize_Servlets;
      App.Add_Servlet (Name => "faces", Server => App.Self.Faces'Access);
      App.Add_Servlet (Name => "files", Server => App.Self.Files'Access);
      App.Add_Servlet (Name => "ajax", Server => App.Self.Ajax'Access);
      App.Add_Servlet (Name => "measures", Server => App.Self.Measures'Access);
      App.Add_Servlet (Name => "auth", Server => App.Self.Auth'Access);
      App.Add_Servlet (Name => "verify-auth", Server => App.Self.Verify_Auth'Access);
      App.Add_Servlet (Name => "api", Server => App.Self.Api'Access);
      App.Add_Servlet (Name => "oauth", Server => App.Self.OAuth'Access);
   end Initialize_Servlets;

   --  ------------------------------
   --  Initialize the filters provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application filters.
   --  ------------------------------
   overriding
   procedure Initialize_Filters (App : in out Application) is
   begin
      Log.Info ("Initializing application filters...");

      AWA.Applications.Application (App).Initialize_Filters;
      App.Add_Filter (Name => "dump", Filter => App.Self.Dump'Access);
      App.Add_Filter (Name => "measures", Filter => App.Self.Measures'Access);
      App.Add_Filter (Name => "service", Filter => App.Self.Service_Filter'Access);
      App.Add_Filter (Name => "no-cache", Filter => App.Self.No_Cache'Access);
      App.Add_Filter (Name => "oauth", Filter => App.Self.Api_Filter'Access);
   end Initialize_Filters;

   --  ------------------------------
   --  Initialize the AWA modules provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the modules used by the application.
   --  ------------------------------
   overriding
   procedure Initialize_Modules (App : in out Application) is
   begin
      Log.Info ("Initializing application modules...");

      App.Add_Converter (Name      => "smartDateConverter",
                         Converter => App.Self.Rel_Date_Converter'Access);
      App.Add_Converter (Name      => "sizeConverter",
                         Converter => App.Self.Size_Converter'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Users.Modules.NAME,
                URI    => "user",
                Module => App.User_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Workspaces.Modules.NAME,
                URI    => "workspaces",
                Module => App.Workspace_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Mail.Modules.NAME,
                URI    => "mail",
                Module => App.Mail_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Comments.Modules.NAME,
                URI    => "comments",
                Module => App.Comment_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Tags.Modules.NAME,
                URI    => "tags",
                Module => App.Tag_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Jobs.Modules.NAME,
                URI    => "jobs",
                Module => App.Job_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Storages.Modules.NAME,
                URI    => "storages",
                Module => App.Storage_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Images.Modules.NAME,
                URI    => "images",
                Module => App.Image_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Counters.Modules.NAME,
                URI    => "counters",
                Module => App.Counter_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Wikis.Modules.NAME,
                URI    => "wikis",
                Module => App.Wiki_Module'Access);

      Register (App    => App.Self.all'Access,
                Name   => AWA.Wikis.Previews.NAME,
                URI    => "wikis-preview",
                Module => App.Preview_Module'Access);
      Register (App    => App.Self.all'Access,
                Name   => Hyperion.Hosts.Modules.NAME,
                URI    => "hosts",
                Module => App.Host_Module'Access);
      Register (App    => App.Self.all'Access,
                Name   => Hyperion.Agents.Modules.NAME,
                URI    => "agents",
                Module => App.Agent_Module'Access);
   end Initialize_Modules;

end Hyperion.Applications;
