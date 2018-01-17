-----------------------------------------------------------------------
--  swagger-server -- Rest server support
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
with Servlet.Rest;
with Servlet.Core;
with Security.Permissions;
package Swagger.Servers is

   subtype Application_Type is Servlet.Core.Servlet_Registry;

   subtype Request is Servlet.Rest.Request;

   subtype Response is Servlet.Rest.Response;

   subtype Output_Stream is Servlet.Rest.Output_Stream;

   subtype Method_Type is Servlet.Rest.Method_Type;

   GET    : constant Method_Type := Servlet.Rest.GET;
   POST   : constant Method_Type := Servlet.Rest.POST;
   DELETE : constant Method_Type := Servlet.Rest.DELETE;
   PUT    : constant Method_Type := Servlet.Rest.PUT;

   subtype Descriptor_Access is Servlet.Rest.Descriptor_Access;

   --  Get a request parameter defined in the URI path.
   procedure Get_Path_Parameter (Req   : in Request'Class;
                                 Pos   : in Positive;
                                 Value : out UString);

   --  Get a request parameter defined in the URI path.
   procedure Get_Path_Parameter (Req   : in Request'Class;
                                 Pos   : in Positive;
                                 Value : out Long);

   --  Get a request parameter from the query string.
   procedure Get_Query_Parameter (Req   : in Request'Class;
                                  Name  : in String;
                                  Value : out UString);
   procedure Get_Query_Parameter (Req   : in Request'Class;
                                  Name  : in String;
                                  Value : out Nullable_UString);

   --  Get a request parameter from the query string.
   procedure Get_Query_Parameter (Req   : in Request'Class;
                                  Name  : in String;
                                  Value : out UString_Vectors.Vector);
   procedure Get_Query_Parameter (Req   : in Request'Class;
                                  Name  : in String;
                                  Value : out Nullable_UString_Vectors.Vector);

   --  Get a request parameter passed in the form.
   procedure Get_Parameter (Req   : in Request'Class;
                            Name  : in String;
                            Value : out Long);

   --  Get a request parameter passed in the form.
   procedure Get_Parameter (Req   : in Request'Class;
                            Name  : in String;
                            Value : out Integer);

   --  Get a request parameter passed in the form.
   procedure Get_Parameter (Req   : in Request'Class;
                            Name  : in String;
                            Value : out UString);
   procedure Get_Parameter (Req   : in Request'Class;
                            Name  : in String;
                            Value : out Nullable_UString);

   --  Get a request parameter passed in the form.
   procedure Get_Parameter (Req   : in Request'Class;
                            Name  : in String;
                            Value : out Boolean);

   --  Read the request body and get a value object tree.
   procedure Read (Req   : in Request'Class;
                   Value : out Value_Type);

   type Context_Type is tagged limited private;

   procedure Initialize (Context : in out Context_Type;
                         Req     : in out Request'Class;
                         Reply   : in out Response'Class);

   procedure Register (Registry   : in out Servlet.Core.Servlet_Registry'Class;
                       Definition : in Descriptor_Access)
     renames Servlet.Rest.Register;

   -- Set the response error code with a message to return.
   procedure Set_Error (Context : in out Context_Type;
                        Code    : in Natural;
                        Message : in String);

   --  Returns True if the client doing the request has the given permission.
   function Has_Permission (Context    : in Context_Type;
                            Permission : in Security.Permissions.Permission_Index) return Boolean;

private

   type Context_Type is tagged limited record
      Req   : access Request'Class;
      Reply : access Response'Class;
   end record;

end Swagger.Servers;
