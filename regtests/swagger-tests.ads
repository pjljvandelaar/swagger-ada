-----------------------------------------------------------------------
--  swagger-tests -- Unit tests for REST clients
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
with Ada.Strings.Unbounded;
with Util.Tests;
with Swagger.Credentials.OAuth;
with TestAPI.Clients;
package Swagger.Tests is

   procedure Add_Tests (Suite : in Util.Tests.Access_Test_Suite);

   type Test is new Util.Tests.Test with record
      Server : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   overriding
   procedure Set_Up (T : in out Test);

   procedure Configure (T : in out Test;
                        Client : in out TestAPI.Clients.Client_Type);

   procedure Authenticate (T    : in out Test;
                           Cred : in out Swagger.Credentials.OAuth.OAuth2_Credential_Type);

   --  Test unauthorized operations.
   procedure Test_Unauthorized (T : in out Test);

   --  Test authorized operations.
   procedure Test_Authorized (T : in out Test);

end Swagger.Tests;
