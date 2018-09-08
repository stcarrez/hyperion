--  Hyperion API
--  Hyperion Monitoring API The monitoring agent is first registered so that the server knows it as well as its security key.  Each host are then registered by a monitoring agent. 
--
--  OpenAPI spec version: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by the swagger code generator 3.2.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.
with Swagger.Streams;
with Swagger.Servers.Operation;
package body Hyperion.Rest.Skeletons is

   package body Skeleton is


      package API_Register_Agent is
         new Swagger.Servers.Operation (Handler => Register_Agent,
                                        Method  => Swagger.Servers.POST,
                                        URI     => "/agents");

      --  Register a monitoring agent
      procedure Register_Agent
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type) is
         Impl : Implementation_Type;
         Name : Swagger.UString;
         Ip : Swagger.UString;
         Agent_Key : Swagger.UString;
         Result : Hyperion.Rest.Models.Agent_Type;
      begin
         if not Context.Is_Authenticated then
            Context.Set_Error (401, "Not authenticated");
            return;
         end if;
         if not Context.Has_Permission (ACL_Agent_Register.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Create_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Write_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Read_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         Swagger.Servers.Get_Parameter (Context, "name", Name);
         Swagger.Servers.Get_Parameter (Context, "ip", Ip);
         Swagger.Servers.Get_Parameter (Context, "agentKey", Agent_Key);
         Impl.Register_Agent
            (Name,
             Ip,
             Agent_Key, Result, Context);
         if Context.Get_Status = 200 then
            Stream.Start_Document;
            Hyperion.Rest.Models.Serialize (Stream, "", Result);
            Stream.End_Document;
         end if;
      end Register_Agent;

      package API_Create_Host is
         new Swagger.Servers.Operation (Handler => Create_Host,
                                        Method  => Swagger.Servers.POST,
                                        URI     => "/hosts");

      --  Create a host
      procedure Create_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type) is
         Impl : Implementation_Type;
         Name : Swagger.UString;
         Ip : Swagger.UString;
         Host_Key : Swagger.UString;
         Result : Hyperion.Rest.Models.Host_Type;
      begin
         if not Context.Is_Authenticated then
            Context.Set_Error (401, "Not authenticated");
            return;
         end if;
         if not Context.Has_Permission (ACL_Agent_Register.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Create_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Write_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Read_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         Swagger.Servers.Get_Parameter (Context, "name", Name);
         Swagger.Servers.Get_Parameter (Context, "ip", Ip);
         Swagger.Servers.Get_Parameter (Context, "hostKey", Host_Key);
         Impl.Create_Host
            (Name,
             Ip,
             Host_Key, Result, Context);
         if Context.Get_Status = 200 then
            Stream.Start_Document;
            Hyperion.Rest.Models.Serialize (Stream, "", Result);
            Stream.End_Document;
         end if;
      end Create_Host;

      procedure Register (Server : in out Swagger.Servers.Application_Type'Class) is
      begin
         Swagger.Servers.Register (Server, API_Register_Agent.Definition);
         Swagger.Servers.Register (Server, API_Create_Host.Definition);
      end Register;

   end Skeleton;

   package body Shared_Instance is


      --  Register a monitoring agent
      procedure Register_Agent
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type) is
         Name : Swagger.UString;
         Ip : Swagger.UString;
         Agent_Key : Swagger.UString;
         Result : Hyperion.Rest.Models.Agent_Type;
      begin
         if not Context.Is_Authenticated then
            Context.Set_Error (401, "Not authenticated");
            return;
         end if;
         if not Context.Has_Permission (ACL_Agent_Register.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Create_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Write_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Read_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         Swagger.Servers.Get_Parameter (Context, "name", Name);
         Swagger.Servers.Get_Parameter (Context, "ip", Ip);
         Swagger.Servers.Get_Parameter (Context, "agentKey", Agent_Key);
         Server.Register_Agent
            (Name,
             Ip,
             Agent_Key, Result, Context);
         if Context.Get_Status = 200 then
            Stream.Start_Document;
            Hyperion.Rest.Models.Serialize (Stream, "", Result);
            Stream.End_Document;
         end if;
      end Register_Agent;

      package API_Register_Agent is
         new Swagger.Servers.Operation (Handler => Register_Agent,
                                        Method  => Swagger.Servers.POST,
                                        URI     => "/agents");

      --  Create a host
      procedure Create_Host
         (Req     : in out Swagger.Servers.Request'Class;
          Reply   : in out Swagger.Servers.Response'Class;
          Stream  : in out Swagger.Servers.Output_Stream'Class;
          Context : in out Swagger.Servers.Context_Type) is
         Name : Swagger.UString;
         Ip : Swagger.UString;
         Host_Key : Swagger.UString;
         Result : Hyperion.Rest.Models.Host_Type;
      begin
         if not Context.Is_Authenticated then
            Context.Set_Error (401, "Not authenticated");
            return;
         end if;
         if not Context.Has_Permission (ACL_Agent_Register.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Create_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Write_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         if not Context.Has_Permission (ACL_Read_Host.Permission) then
            Context.Set_Error (403, "Permission denied");
            return;
         end if;
         Swagger.Servers.Get_Parameter (Context, "name", Name);
         Swagger.Servers.Get_Parameter (Context, "ip", Ip);
         Swagger.Servers.Get_Parameter (Context, "hostKey", Host_Key);
         Server.Create_Host
            (Name,
             Ip,
             Host_Key, Result, Context);
         if Context.Get_Status = 200 then
            Stream.Start_Document;
            Hyperion.Rest.Models.Serialize (Stream, "", Result);
            Stream.End_Document;
         end if;
      end Create_Host;

      package API_Create_Host is
         new Swagger.Servers.Operation (Handler => Create_Host,
                                        Method  => Swagger.Servers.POST,
                                        URI     => "/hosts");

      procedure Register (Server : in out Swagger.Servers.Application_Type'Class) is
      begin
         Swagger.Servers.Register (Server, API_Register_Agent.Definition);
         Swagger.Servers.Register (Server, API_Create_Host.Definition);
      end Register;

      protected body Server is
         --  Register a monitoring agent
         procedure Register_Agent
            (Name : in Swagger.UString;
             Ip : in Swagger.UString;
             Agent_Key : in Swagger.UString;
             Result : out Hyperion.Rest.Models.Agent_Type;
             Context : in out Swagger.Servers.Context_Type) is
         begin
            Impl.Register_Agent
               (Name,
                Ip,
                Agent_Key,
                Result,
                Context);
         end Register_Agent;

         --  Create a host
         procedure Create_Host
            (Name : in Swagger.UString;
             Ip : in Swagger.UString;
             Host_Key : in Swagger.UString;
             Result : out Hyperion.Rest.Models.Host_Type;
             Context : in out Swagger.Servers.Context_Type) is
         begin
            Impl.Create_Host
               (Name,
                Ip,
                Host_Key,
                Result,
                Context);
         end Create_Host;

      end Server;

   end Shared_Instance;

end Hyperion.Rest.Skeletons;
