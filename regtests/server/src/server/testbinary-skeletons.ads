--  REST API Validation
--  API to validate
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 6.1.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.

pragma Warnings (Off, "*is not referenced");
pragma Warnings (Off, "*no entities of*are referenced");
with Swagger.Servers;
with TestBinary.Models;
with Security.Permissions;
with External;
package TestBinary.Skeletons is
   pragma Style_Checks ("-bmrIu");
   pragma Warnings (Off, "*use clause for package*");
   use TestBinary.Models;
   type Server_Type is limited interface;

   --  Get an image
   --  Get an image
   procedure Do_Get_Image
     (Server  : in out Server_Type;
      Status  : in     Status_Type;
      Owner   : in     Swagger.Nullable_UString;
      Result  :    out Swagger.Blob_Ref;
      Context : in out Swagger.Servers.Context_Type) is abstract;

   --  Get some stat from external struct
   procedure Do_Get_Stats
     (Server  : in out Server_Type;
      Status  : in     Status_Type;
      Result  :    out External.Stat_Vector;
      Context : in out Swagger.Servers.Context_Type) is abstract;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Skeleton is

      procedure Register
        (Server : in out Swagger.Servers.Application_Type'Class);

      --  Get an image
      procedure Do_Get_Image
        (Req     : in out Swagger.Servers.Request'Class;
         Reply   : in out Swagger.Servers.Response'Class;
         Stream  : in out Swagger.Servers.Output_Stream'Class;
         Context : in out Swagger.Servers.Context_Type);

      --  Get some stat from external struct
      procedure Do_Get_Stats
        (Req     : in out Swagger.Servers.Request'Class;
         Reply   : in out Swagger.Servers.Response'Class;
         Stream  : in out Swagger.Servers.Output_Stream'Class;
         Context : in out Swagger.Servers.Context_Type);

   end Skeleton;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Shared_Instance is

      procedure Register
        (Server : in out Swagger.Servers.Application_Type'Class);

      --  Get an image
      procedure Do_Get_Image
        (Req     : in out Swagger.Servers.Request'Class;
         Reply   : in out Swagger.Servers.Response'Class;
         Stream  : in out Swagger.Servers.Output_Stream'Class;
         Context : in out Swagger.Servers.Context_Type);

      --  Get some stat from external struct
      procedure Do_Get_Stats
        (Req     : in out Swagger.Servers.Request'Class;
         Reply   : in out Swagger.Servers.Response'Class;
         Stream  : in out Swagger.Servers.Output_Stream'Class;
         Context : in out Swagger.Servers.Context_Type);

   private
      protected Server is

         --  Get an image
         procedure Do_Get_Image
           (Status  : in     Status_Type;
            Owner   : in     Swagger.Nullable_UString;
            Result  :    out Swagger.Blob_Ref;
            Context : in out Swagger.Servers.Context_Type);

         --  Get some stat from external struct
         procedure Do_Get_Stats
           (Status  : in     Status_Type;
            Result  :    out External.Stat_Vector;
            Context : in out Swagger.Servers.Context_Type);

      private
         Impl : Implementation_Type;
      end Server;
   end Shared_Instance;

end TestBinary.Skeletons;
