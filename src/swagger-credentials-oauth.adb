-----------------------------------------------------------------------
--  swagger-credentials-oauth -- OAuth2 client credentials
--  Copyright (C) 2018 Stephane Carrez
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

package body Swagger.Credentials.OAuth is

   use type Security.OAuth.Clients.Access_Token_Access;

   --  ------------------------------
   --  Set the credendials on the HTTP client request before doing the call.
   --  ------------------------------
   overriding
   procedure Set_Credentials (Credential : in OAuth2_Credential_Type;
                              Into       : in out Util.Http.Clients.Client'Class) is
   begin
      if Credential.Token /= null then
         Into.Add_Header (Name  => "Authorization",
                          Value => "Bearer " & Credential.Token.Get_Name);
      end if;
   end Set_Credentials;

end Swagger.Credentials.OAuth;
