-----------------------------------------------------------------------
--  Hyperion-server -- Application server
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
with Ada.Exceptions;

with Util.Log.loggers;

with AWS.Config.Set;
with ASF.Server.Web;
with AWA.Setup.Applications;

with Hyperion.Applications;
procedure Hyperion.Server is

   Log     : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion.Server");
   App     : constant Hyperion.Applications.Application_Access := new Hyperion.Applications.Application;

   procedure Setup is
     new AWA.Setup.Applications.Configure (Hyperion.Applications.Application'Class,
                                           Hyperion.Applications.Application_Access,
                                           Hyperion.Applications.Initialize);

   WS      : ASF.Server.Web.AWS_Container;

   procedure Configure (Config : in out AWS.Config.Object) is
   begin
      AWS.Config.Set.Input_Line_Size_Limit (1_000_000);
      AWS.Config.Set.Max_Connection (Config, 2);
      AWS.Config.Set.Accept_Queue_Size (Config, 100);
      AWS.Config.Set.Send_Buffer_Size (Config, 128 * 1024);
      AWS.Config.Set.Upload_Size_Limit (Config, 100_000_000);
   end Configure;

begin
   WS.Configure (Configure'Access);
   WS.Start;
   Log.Info ("Connect you browser to: http://localhost:8080{0}/index.html",
             Hyperion.Applications.CONTEXT_PATH);
   Setup (WS, App, Hyperion.Applications.CONFIG_PATH,
          Hyperion.Applications.CONTEXT_PATH);
   delay 365.0 * 24.0 * 3600.0;
   App.Close;
exception
   when E: others =>
      Log.Error ("Exception in server: " &
                 Ada.Exceptions.Exception_Name (E) & ": " &
                 Ada.Exceptions.Exception_Message (E));
end Hyperion.Server;
