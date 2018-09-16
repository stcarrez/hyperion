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

with Util.Log.Loggers;
with Util.Beans.Objects.Maps;
with Util.Serialize.IO.JSON;
with Util.Beans.Objects.Readers;
with Servlet.Streams;
with Swagger.Servers;
with Swagger.Servers.Operation;
package body Hyperion.Rest.Servers is

   Log : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Hyperion.Rest.Servers");

   procedure Process_Snapshot
     (Req     : in out Swagger.Servers.Request'Class;
      Reply   : in out Swagger.Servers.Response'Class;
      Stream  : in out Swagger.Servers.Output_Stream'Class;
      Context : in out Swagger.Servers.Context_Type);

   package Server_Impl is
      new Hyperion.Rest.Skeletons.Skeleton (Server_Type, URI_Prefix => "/api/v1");

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

   package API_Process_Snapshot is
     new Swagger.Servers.Operation (Handler => Process_Snapshot,
                                    Method  => Swagger.Servers.POST,
                                    URI     => "/api/v1/hosts/{host_id}/snapshot");

   --  Register a monitoring agent
   procedure Process_Snapshot
     (Req     : in out Swagger.Servers.Request'Class;
      Reply   : in out Swagger.Servers.Response'Class;
      Stream  : in out Swagger.Servers.Output_Stream'Class;
      Context : in out Swagger.Servers.Context_Type) is
      Name : Swagger.UString;
      Ip : Swagger.UString;
      Agent_Key : Swagger.UString;
      Result : Hyperion.Rest.Models.Agent_Type;
      Input  : constant Servlet.Streams.Input_Stream_Access := Req.Get_Input_Stream;
      Parser : Util.Serialize.IO.JSON.Parser;
      Mapper : Util.Beans.Objects.Readers.Reader;
      Root   : Util.Beans.Objects.Object;
      Key    : Util.Beans.Objects.Object;
      Snapshot : Util.Beans.Objects.Object;
      
      package UBO renames Util.Beans.Objects;

      procedure Process_Data (Name : in String;
                              Data : in Util.Beans.Objects.Object) is
        
         Start_Time : Natural := UBO.To_Integer (UBO.Get_Value (Data, "start_time"));
         End_Time   : Natural := UBO.To_Integer (UBO.Get_Value (Data, "end_time"));
         Snapshot   : UBO.Object := UBO.Get_Value (Data, "snapshot");

         procedure Process_Snapshot (Name : in String;
                                     Data : in Util.Beans.Objects.Object) is
         begin
            Log.Info ("  probe {0} - ", Name);
         end Process_Snapshot;

      begin
         if Start_Time = 0 and End_Time = 0 then
            Util.Beans.Objects.Maps.Iterate (Data, Process_Data'Access);
         else
            Log.Info ("Data {0} - {1} to {2}", Name, Natural'Image (Start_Time),
                      Natural'Image (End_Time));
            Util.Beans.Objects.Maps.Iterate (Snapshot, Process_Snapshot'Access);
         end if;
      end Process_Data;

   begin
      if not Context.Is_Authenticated then
         Context.Set_Error (401, "Not authenticated");
         return;
      end if;
      if not Context.Has_Permission (Skeletons.ACL_Write_Host.Permission) then
         Context.Set_Error (403, "Permission denied");
         return;
      end if;

      Parser.Parse (Input.all, Mapper);
      Root := Mapper.Get_Root;
      Key := Util.Beans.Objects.Get_Value (Root, "host_key");
      Snapshot := Util.Beans.Objects.Get_Value (Root, "snapshot");
      Util.Beans.Objects.Maps.Iterate (Snapshot, Process_Data'Access);
      Context.Set_Status (200);
   end Process_Snapshot;

   procedure Register (Server : in out Swagger.Servers.Application_Type'Class) is
   begin
      Server_Impl.Register (Server);
      Swagger.Servers.Register (Server, API_Process_Snapshot.Definition);
   end Register;

end Hyperion.Rest.Servers;
