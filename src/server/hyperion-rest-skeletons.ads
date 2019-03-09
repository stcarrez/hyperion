--  Hyperion API
--  Hyperion Monitoring API The monitoring agent is first registered so that the server knows it as well as its security key.  Each host are then registered by a monitoring agent. 
--
--  OpenAPI spec version: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by the swagger code generator 3.3.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.
with Swagger.Servers;
with Hyperion.Rest.Models;
with Security.Permissions;
package Hyperion.Rest.Skeletons is
   use Hyperion.Rest.Models;
   type Server_Type is limited interface;

   --  Register a new monitoring agent
   package ACL_Agent_Register is new Security.Permissions.Definition ("agent:register");

   --  Register and create a host
   package ACL_Create_Host is new Security.Permissions.Definition ("create:host");

   --  Update a new host
   package ACL_Write_Host is new Security.Permissions.Definition ("write:host");

   --  Read a host information
   package ACL_Host_Read is new Security.Permissions.Definition ("host:read");



   --  Register a monitoring agent
   --  Register a new monitoring agent in the system
   procedure Register_Agent
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Agent_Key : in Swagger.UString;
       Result  : out Hyperion.Rest.Models.Agent_Type;
       Context : in out Swagger.Servers.Context_Type) is abstract;

   --  Get information about the host datasets
   --  The datasets describes and gives access to the monitored data.
   procedure Get_Datasets
      (Server : in out Server_Type;
       Host_Id : in Swagger.Long;
       Result  : out Hyperion.Rest.Models.Dataset_Type_Vectors.Vector;
       Context : in out Swagger.Servers.Context_Type) is abstract;

   --  Get information about the host
   --  Provide information about the host
   procedure Get_Host
      (Server : in out Server_Type;
       Host_Id : in Swagger.Long;
       Result  : out Hyperion.Rest.Models.Host_Type;
       Context : in out Swagger.Servers.Context_Type) is abstract;

   --  Create a host
   --  Register a new host in the monitoring system
   procedure Create_Host
      (Server : in out Server_Type;
       Name : in Swagger.UString;
       Ip : in Swagger.UString;
       Host_Key : in Swagger.UString;
       Agent_Key : in Swagger.UString;
       Agent_Id : in Integer;
       Result  : out Hyperion.Rest.Models.Host_Type;
       Context : in out Swagger.Servers.Context_Type) is abstract;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Skeleton is

      procedure Register (Server : in out Swagger.Servers.Application_Type'Class);


      --  Register a monitoring agent
      procedure Register_Agent
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Get information about the host datasets
      procedure Get_Datasets
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Get information about the host
      procedure Get_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Create a host
      procedure Create_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);

   end Skeleton;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Shared_Instance is

      procedure Register (Server : in out Swagger.Servers.Application_Type'Class);


      --  Register a monitoring agent
      procedure Register_Agent
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Get information about the host datasets
      procedure Get_Datasets
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Get information about the host
      procedure Get_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


      --  Create a host
      procedure Create_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type);


   private
      protected Server is

         --  Register a monitoring agent
         procedure Register_Agent
            (Name : in Swagger.UString;
             Ip : in Swagger.UString;
             Agent_Key : in Swagger.UString;
             Result  : out Hyperion.Rest.Models.Agent_Type;
             Context : in out Swagger.Servers.Context_Type);

         --  Get information about the host datasets
         procedure Get_Datasets
            (Host_Id : in Swagger.Long;
             Result  : out Hyperion.Rest.Models.Dataset_Type_Vectors.Vector;
             Context : in out Swagger.Servers.Context_Type);

         --  Get information about the host
         procedure Get_Host
            (Host_Id : in Swagger.Long;
             Result  : out Hyperion.Rest.Models.Host_Type;
             Context : in out Swagger.Servers.Context_Type);

         --  Create a host
         procedure Create_Host
            (Name : in Swagger.UString;
             Ip : in Swagger.UString;
             Host_Key : in Swagger.UString;
             Agent_Key : in Swagger.UString;
             Agent_Id : in Integer;
             Result  : out Hyperion.Rest.Models.Host_Type;
             Context : in out Swagger.Servers.Context_Type);

      private
         Impl : Implementation_Type;
      end Server;
   end Shared_Instance;

end Hyperion.Rest.Skeletons;
