--  Hyperion API
--  Hyperion Monitoring API The monitoring agent is first registered so that the server knows it as well as its security key.  Each host are then registered by a monitoring agent. 
--  ------------ EDIT NOTE ------------
--  This file was generated with swagger-codegen.  You can modify it to implement
--  the server.  After you modify this file, you should add the following line
--  to the .swagger-codegen-ignore file:
--
--  src/hyperion-rest-servers.ads
--
--  Then, you can drop this edit note comment.
--  ------------ EDIT NOTE ------------
with Swagger.Servers;
with Hyperion.Rest.Models;
with Hyperion.Rest.Skeletons;
package Hyperion.Rest.Servers is
   use Hyperion.Rest.Models;
   type Server_Type is limited new Hyperion.Rest.Skeletons.Server_Type with null record;


   --  Register a monitoring agent
   --  Register a new monitoring agent in the system
   overriding
   procedure Register_Agent
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Agent_Key : in Swagger.UString;
       Result  : out Hyperion.Rest.Models.Agent_Type;
       Context : in out Swagger.Servers.Context_Type);

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
       Context : in out Swagger.Servers.Context_Type);

   --  Get information about the host
   --  Provide information about the host
   procedure Get_Host
      (Server : in out Server_Type;
       Host_Id : in Swagger.Long;
       Result  : out Hyperion.Rest.Models.Host_Type;
       Context : in out Swagger.Servers.Context_Type);

   --  Get information about the host datasets
   --  The datasets describes and gives access to the monitored data.
   overriding
   procedure Get_Datasets
      (Server : in out Server_Type;
       Host_Id : in Swagger.Long;
       Result  : out Hyperion.Rest.Models.Dataset_Type_Vectors.Vector;
       Context : in out Swagger.Servers.Context_Type);

   procedure Register (Server : in out Swagger.Servers.Application_Type'Class);
 
end Hyperion.Rest.Servers;
