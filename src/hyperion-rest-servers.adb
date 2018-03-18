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
   begin
      Result.Name   := Name;
      Result.Ip     := Ip;
      Result.Key    := Agent_Key;
      Result.Status := Swagger.To_UString ("");
      Result.Id     := 0;
   end Register_Agent;

   --  Create a host
   --  Register a new host in the monitoring system
   overriding
   procedure Create_Host
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Host_Key : in Swagger.UString;
       Result  : out Hyperion.Rest.Models.Host_Type;
       Context : in out Swagger.Servers.Context_Type) is
   begin
      null;
   end Create_Host;

end Hyperion.Rest.Servers;
