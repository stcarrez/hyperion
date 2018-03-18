-----------------------------------------------------------------------
--  hyperion -- hyperion applications
--  Copyright (C) 2017, 2018 Stephane Carrez
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
with Servlet.Core.Measures;
with Servlet.Core.Files;
with Servlet.Filters.Dump;
with Servlet.Filters.Cache_Control;
with Servlet.Core.Rest;
with Servlet.Security.OAuth;
with Servlet.Security.Filters.OAuth;

with ASF.Servlets.Faces;
with ASF.Servlets.Ajax;
with ASF.Applications;
with ASF.Converters.Sizes;

with ASF.Security.Servlets;
with Security.OAuth.Servers;
with Security.OAuth.File_Registry;

with AWA.Users.Servlets;
with AWA.Users.Modules;
with AWA.Mail.Modules;
with AWA.Comments.Modules;
with AWA.Blogs.Modules;
with AWA.Tags.Modules;
with AWA.Storages.Modules;
with AWA.Applications;
with AWA.Workspaces.Modules;
with AWA.Services.Filters;
with AWA.Wikis.Modules;
with AWA.Wikis.Previews;
with AWA.Images.Modules;
with AWA.Jobs.Modules;
with AWA.Counters.Modules;
with AWA.Converters.Dates;
with Hyperion.Hosts.Modules;
with Hyperion.Agents.Modules;
package Hyperion.Applications is

   CONFIG_PATH  : constant String := "hyperion";
   CONTEXT_PATH : constant String := "/hyperion";

   type Application is new AWA.Applications.Application with private;
   type Application_Access is access all Application'Class;

   --  Initialize the application.
   procedure Initialize (App    : in Application_Access;
                         Config : in ASF.Applications.Config);

   --  Initialize the application configuration properties.  Properties defined in <b>Conf</b>
   --  are expanded by using the EL expression resolver.
   overriding
   procedure Initialize_Config (App  : in out Application;
                                Conf : in out ASF.Applications.Config);

   --  Initialize the servlets provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application servlets.
   overriding
   procedure Initialize_Servlets (App : in out Application);

   --  Initialize the filters provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the application filters.
   overriding
   procedure Initialize_Filters (App : in out Application);

   --  Initialize the AWA modules provided by the application.
   --  This procedure is called by <b>Initialize</b>.
   --  It should register the modules used by the application.
   overriding
   procedure Initialize_Modules (App : in out Application);

private

   type Application is new AWA.Applications.Application with record
      Self               : Application_Access;

      --  Application servlets and filters (add new servlet and filter instances here).
      Faces              : aliased ASF.Servlets.Faces.Faces_Servlet;
      Ajax               : aliased ASF.Servlets.Ajax.Ajax_Servlet;
      Files              : aliased Servlet.Core.Files.File_Servlet;
      Dump               : aliased Servlet.Filters.Dump.Dump_Filter;
      Service_Filter     : aliased AWA.Services.Filters.Service_Filter;
      Measures           : aliased Servlet.Core.Measures.Measure_Servlet;
      No_Cache           : aliased Servlet.Filters.Cache_Control.Cache_Control_Filter;
      Api                : aliased Servlet.Core.Rest.Rest_Servlet;

      --  Authentication servlet and filter.
      Auth               : aliased ASF.Security.Servlets.Request_Auth_Servlet;
      Verify_Auth        : aliased AWA.Users.Servlets.Verify_Auth_Servlet;
      OAuth              : aliased Servlet.Security.OAuth.Token_Servlet;

      --  Converters shared by web requests.
      Rel_Date_Converter : aliased AWA.Converters.Dates.Relative_Date_Converter;
      Size_Converter     : aliased ASF.Converters.Sizes.Size_Converter;

      --  The application modules.
      User_Module        : aliased AWA.Users.Modules.User_Module;
      Workspace_Module   : aliased AWA.Workspaces.Modules.Workspace_Module;
      Blog_Module        : aliased AWA.Blogs.Modules.Blog_Module;
      Mail_Module        : aliased AWA.Mail.Modules.Mail_Module;
      Comment_Module     : aliased AWA.Comments.Modules.Comment_Module;
      Storage_Module     : aliased AWA.Storages.Modules.Storage_Module;
      Tag_Module         : aliased AWA.Tags.Modules.Tag_Module;
      Job_Module         : aliased AWA.Jobs.Modules.Job_Module;
      Image_Module       : aliased AWA.Images.Modules.Image_Module;
      Wiki_Module        : aliased AWA.Wikis.Modules.Wiki_Module;
      Preview_Module     : aliased AWA.Wikis.Previews.Preview_Module;
      Counter_Module     : aliased AWA.Counters.Modules.Counter_Module;

      --  REST security
      Api_Auth           : aliased Security.OAuth.Servers.Auth_Manager;
      Apps               : aliased Security.OAuth.File_Registry.File_Application_Manager;
      Realm              : aliased Security.OAuth.File_Registry.File_Realm_Manager;
      Api_Filter         : aliased Servlet.Security.Filters.OAuth.Auth_Filter;

      --  Add your modules here.
      Host_Module        : aliased Hyperion.Hosts.Modules.Host_Module;
      Agent_Module       : aliased Hyperion.Agents.Modules.Agent_Module;
   end record;

end Hyperion.Applications;
