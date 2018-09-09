--  Hyperion API
--  Hyperion Monitoring API The monitoring agent is first registered so that the server knows it as well as its security key.  Each host are then registered by a monitoring agent. 
--  ------------ EDIT NOTE ------------
--  This file was generated with swagger-codegen.  You can modify it to implement
--  the server.  After you modify this file, you should add the following line
--  to the .swagger-codegen-ignore file:
--
--  src/hyperion-rest-servers.adb
--
--  Then, you can drop this edit note comment.
--  ------------ EDIT NOTE ------------
with Hyperion.Agents.Modules;
with Hyperion.Agents.Models;
with Hyperion.Hosts.Modules;
with Hyperion.Hosts.Models;
with ADO.Objects;
package body Hyperion.Rest.Servers is


   --  Register a monitoring agent
   --  Register a new monitoring agent in the system
   overriding
   procedure Register_Agent
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Agent_Key : in Swagger.UString;
       Result  : out Hyperion.Rest.Models.Agent_Type;
       Context : in out Swagger.Servers.Context_Type) is
      Module : Agents.Modules.Agent_Module_Access := Agents.Modules.Get_Agent_Module;
      Agent  : Agents.Models.Agent_Ref;
   begin
      Agent.Set_Hostname (Name);
      Agent.Set_Ip (Ip);
      Agent.Set_Key (Agent_Key);
      Module.Register_Agent (Agent);
      Result.Name   := Name;
      Result.Ip     := Ip;
      Result.Key    := Agent_Key;
      Result.Status := Swagger.To_UString ("");
      Result.Create_Date := Agent.Get_Create_Date;
      Result.Id     := Swagger.Long (Agent.Get_Id);
   end Register_Agent;

   --  Create a host
   --  Register a new host in the monitoring system
   overriding
   procedure Create_Host
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Host_Key : in Swagger.UString;
       Agent_Key : in Swagger.UString;
       Agent_Id : in Integer;
       Result  : out Hyperion.Rest.Models.Host_Type;
       Context : in out Swagger.Servers.Context_Type) is
      Module : Hosts.Modules.Host_Module_Access := Hosts.Modules.Get_Host_Module;
      Host   : Hosts.Models.Host_Ref;
   begin
      Host.Set_Name (Name);
      Host.Set_Ip (Ip);
      Host.Set_Key (Host_Key);
      Module.Create_Host (Agent_Key => Swagger.To_String (Agent_Key),
                          Host      => Host);
      Result.Name := Host.Get_Name;
      Result.Id := Swagger.Long (Host.Get_Id);
      Result.Ip := Host.Get_Ip;
      Result.Create_Date := Host.Get_Create_Date;
      
   exception
      when ADO.Objects.NOT_FOUND =>
         Context.Set_Error (Code    => 405,
                            Message => "Invalid agent key");
   end Create_Host;

end Hyperion.Rest.Servers;
