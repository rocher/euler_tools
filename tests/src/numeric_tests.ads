--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--   _____      _             _____           _       _____         _
--  | ____|   _| | ___ _ __  |_   _|__   ___ | |___  |_   _|__  ___| |_ ___
--  |  _|| | | | |/ _ \ '__|   | |/ _ \ / _ \| / __|   | |/ _ \/ __| __/ __|
--  | |__| |_| | |  __/ |      | | (_) | (_) | \__ \   | |  __/\__ \ |_\__ \
--  |_____\__,_|_|\___|_|      |_|\___/ \___/|_|___/   |_|\___||___/\__|___/
--
-- ----------------------------------------------------------------------------

with AUnit;            use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package Numeric_Tests is
   type Numeric_Test_Case is new Test_Case with null record;

   overriding function Name (T : Numeric_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Numeric_Test_Case);

   procedure Test_Concat (T : in out Test_Case'Class);
   procedure Test_Hundreds (T : in out Test_Case'Class);
   procedure Test_Is_Even (T : in out Test_Case'Class);
   procedure Test_Is_Odd (T : in out Test_Case'Class);
   procedure Test_Is_Palindrome (T : in out Test_Case'Class);
   procedure Test_Left (T : in out Test_Case'Class);
   procedure Test_Length (T : in out Test_Case'Class);
   procedure Test_Right (T : in out Test_Case'Class);
   procedure Test_Sub_Number (T : in out Test_Case'Class);
   procedure Test_Tens (T : in out Test_Case'Class);
   procedure Test_Thousands (T : in out Test_Case'Class);
   procedure Test_To_Number_Char (T : in out Test_Case'Class);
   procedure Test_To_Number_String (T : in out Test_Case'Class);
   procedure Test_To_String (T : in out Test_Case'Class);
   procedure Test_Units (T : in out Test_Case'Class);

end Numeric_Tests;
