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

with AUnit.Assertions; use AUnit.Assertions;
with Euler_Tools;      use Euler_Tools;

package body Numeric_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Numeric_Test_Case) return Test_String is
     (Format ("Numeric Tests            "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Numeric_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Concat'Access, "Concat");
      Register_Routine (T, Test_Hundreds'Access, "Hundreds");
      Register_Routine (T, Test_Is_Even'Access, "Is_Even");
      Register_Routine (T, Test_Is_Odd'Access, "Is_Odd");
      Register_Routine (T, Test_Is_Palindrome'Access, "Is_Palindrome");
      Register_Routine (T, Test_Left'Access, "Left");
      Register_Routine (T, Test_Length'Access, "Length");
      Register_Routine (T, Test_Right'Access, "Right");
      Register_Routine (T, Test_Sub_Number'Access, "Sub_Number");
      Register_Routine (T, Test_Tens'Access, "Tens");
      Register_Routine (T, Test_Thousands'Access, "Thousands");
      Register_Routine
        (T, Test_To_Number_Char'Access, "To_Number (Character)");
      Register_Routine (T, Test_To_Number_String'Access, "To_Number (String)");
      Register_Routine (T, Test_To_String'Access, "To_String");
      Register_Routine (T, Test_Units'Access, "Units");
   end Register_Tests;

   -----------------
   -- Test_Concat --
   -----------------

   procedure Test_Concat (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Concat (321, 792) = 321_792, "Invalid concatenation of numbers");
      Assert (Concat (554, 034) = 55_434, "Invalid concatenation of numbers");
      Assert (Concat (776, 554) = 776_554, "Invalid concatenation of numbers");
      Assert (Concat (075, 435) = 75_435, "Invalid concatenation of numbers");

      Assert (Concat (175, 435) /= 75_435, "Invalid concatenation of numbers");
      Assert (Concat (175, 935) /= 17_435, "Invalid concatenation of numbers");
   end Test_Concat;

   -------------------
   -- Test_Hundreds --
   -------------------

   procedure Test_Hundreds (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Hundreds (0) = 0, "Invalid hundreds of number");
      Assert (Hundreds (10) = 0, "Invalid hundreds of number");
      Assert (Hundreds (99) = 0, "Invalid hundreds of number");
      Assert (Hundreds (100) = 1, "Invalid hundreds of number");
      Assert (Hundreds (101) = 1, "Invalid hundreds of number");
      Assert (Hundreds (199) = 1, "Invalid hundreds of number");
      Assert (Hundreds (200) = 2, "Invalid hundreds of number");
      Assert (Hundreds (201) = 2, "Invalid hundreds of number");
      Assert (Hundreds (1_100) = 1, "Invalid hundreds of number");
      Assert (Hundreds (2_101) = 1, "Invalid hundreds of number");
      Assert (Hundreds (3_199) = 1, "Invalid hundreds of number");
      Assert (Hundreds (4_200) = 2, "Invalid hundreds of number");
      Assert (Hundreds (5_201) = 2, "Invalid hundreds of number");

      Assert (Hundreds (501) /= 2, "Invalid hundreds of number");
      Assert (Hundreds (601) /= 3, "Invalid hundreds of number");
   end Test_Hundreds;

   ------------------
   -- Test_Is_Even --
   ------------------

   procedure Test_Is_Even (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Is_Even (0), "Invalid even test");
      Assert (Is_Even (2), "Invalid even test");
      Assert (Is_Even (4), "Invalid even test");
      Assert (Is_Even (6), "Invalid even test");
      Assert (Is_Even (8), "Invalid even test");
      Assert (Is_Even (10), "Invalid even test");

      Assert (not Is_Even (1), "Invalid even test");
      Assert (not Is_Even (3), "Invalid even test");
      Assert (not Is_Even (5), "Invalid even test");
      Assert (not Is_Even (7), "Invalid even test");
      Assert (not Is_Even (9), "Invalid even test");
   end Test_Is_Even;

   -----------------
   -- Test_Is_Odd --
   -----------------

   procedure Test_Is_Odd (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Is_Odd (1), "Invalid odd test");
      Assert (Is_Odd (3), "Invalid odd test");
      Assert (Is_Odd (5), "Invalid odd test");
      Assert (Is_Odd (7), "Invalid odd test");
      Assert (Is_Odd (9), "Invalid odd test");

      Assert (not Is_Odd (0), "Invalid odd test");
      Assert (not Is_Odd (2), "Invalid odd test");
      Assert (not Is_Odd (4), "Invalid odd test");
      Assert (not Is_Odd (6), "Invalid odd test");
      Assert (not Is_Odd (8), "Invalid odd test");
      Assert (not Is_Odd (10), "Invalid odd test");
   end Test_Is_Odd;

   ------------------------
   -- Test_Is_Palindrome --
   ------------------------

   procedure Test_Is_Palindrome (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Is_Palindrome (1), "Invalid palindrome test");
      Assert (Is_Palindrome (2), "Invalid palindrome test");
      Assert (Is_Palindrome (7), "Invalid palindrome test");
      Assert (Is_Palindrome (11), "Invalid palindrome test");
      Assert (Is_Palindrome (22), "Invalid palindrome test");
      Assert (Is_Palindrome (66), "Invalid palindrome test");
      Assert (Is_Palindrome (616), "Invalid palindrome test");
      Assert (Is_Palindrome (2_662), "Invalid palindrome test");
      Assert (Is_Palindrome (126_621), "Invalid palindrome test");
      Assert (Is_Palindrome (126_621), "Invalid palindrome test");
      Assert (Is_Palindrome (12_699_621), "Invalid palindrome test");

      Assert (not Is_Palindrome (17), "Invalid palindrome test");
      Assert (not Is_Palindrome (211), "Invalid palindrome test");
      Assert (not Is_Palindrome (220), "Invalid palindrome test");
      Assert (not Is_Palindrome (466), "Invalid palindrome test");
      Assert (not Is_Palindrome (615), "Invalid palindrome test");
      Assert (not Is_Palindrome (2_663), "Invalid palindrome test");
      Assert (not Is_Palindrome (126_631), "Invalid palindrome test");
      Assert (not Is_Palindrome (126_721), "Invalid palindrome test");
      Assert (not Is_Palindrome (12_698_621), "Invalid palindrome test");
   end Test_Is_Palindrome;

   ---------------
   -- Test_Left --
   ---------------

   procedure Test_Left (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Left (0, 1) = 0, "Invalid Left number");
      Assert (Left (123, 1) = 1, "Invalid Left number");
      Assert (Left (123, 2) = 12, "Invalid Left number");
      Assert (Left (123, 3) = 123, "Invalid Left number");
      Assert (Left (123, 4) = 123, "Invalid Left number");
      Assert (Left (123, 5) = 123, "Invalid Left number");
   end Test_Left;

   -----------------
   -- Test_Length --
   -----------------

   procedure Test_Length (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Length (0) = 1, "Invalid Length of number");
      Assert (Length (1) = 1, "Invalid Length of number");
      Assert (Length (2) = 1, "Invalid Length of number");
      Assert (Length (12) = 2, "Invalid Length of number");
      Assert (Length (0_012) = 2, "Invalid Length of number");
      Assert (Length (0_123) = 3, "Invalid Length of number");
      Assert (Length (01_234) = 4, "Invalid Length of number");
      Assert (Length (12_345) = 5, "Invalid Length of number");
   end Test_Length;

   ----------------
   -- Test_Right --
   ----------------

   procedure Test_Right (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Right (0, 1) = 0, "Invalid Right number");
      Assert (Right (123, 1) = 3, "Invalid Right number");
      Assert (Right (123, 2) = 23, "Invalid Right number");
      Assert (Right (123, 3) = 123, "Invalid Right number");
      Assert (Right (123, 4) = 123, "Invalid Right number");
      Assert (Right (123, 5) = 123, "Invalid Right number");
   end Test_Right;

   ---------------------
   -- Test_Sub_Number --
   ---------------------

   procedure Test_Sub_Number (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Sub_Number (0, 1, 1) = 0, "Invalid Sub_Number number");

      Assert (Sub_Number (9, 1, 1) = 9, "Invalid Sub_Number number");
      Assert (Sub_Number (9, 1, 2) = 9, "Invalid Sub_Number number");
      Assert (Sub_Number (9, 1, 3) = 9, "Invalid Sub_Number number");

      Assert (Sub_Number (9, 2, 1) = 0, "Invalid Sub_Number number");
      Assert (Sub_Number (9, 3, 1) = 0, "Invalid Sub_Number number");

      Assert (Sub_Number (123_456, 1, 1) = 1, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 1, 2) = 12, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 1, 3) = 123, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 1, 4) = 1_234, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 1, 5) = 12_345, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 1, 6) = 123_456, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 1, 7) = 123_456, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 1, 8) = 123_456, "Invalid Sub_Number number");

      Assert (Sub_Number (123_456, 2, 1) = 2, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 2, 2) = 23, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 2, 3) = 234, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 2, 4) = 2_345, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 2, 5) = 23_456, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 2, 6) = 23_456, "Invalid Sub_Number number");
      Assert
        (Sub_Number (123_456, 2, 7) = 23_456, "Invalid Sub_Number number");

      Assert (Sub_Number (123_456, 3, 1) = 3, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 3, 2) = 34, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 3, 3) = 345, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 3, 4) = 3_456, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 3, 5) = 3_456, "Invalid Sub_Number number");
      Assert (Sub_Number (123_456, 3, 6) = 3_456, "Invalid Sub_Number number");
   end Test_Sub_Number;

   ---------------
   -- Test_Tens --
   ---------------

   procedure Test_Tens (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Tens (0) = 0, "Invalid tens of number");
      Assert (Tens (5) = 0, "Invalid tens of number");
      Assert (Tens (9) = 0, "Invalid tens of number");
      Assert (Tens (10) = 1, "Invalid tens of number");
      Assert (Tens (11) = 1, "Invalid tens of number");
      Assert (Tens (19) = 1, "Invalid tens of number");
      Assert (Tens (20) = 2, "Invalid tens of number");
      Assert (Tens (21) = 2, "Invalid tens of number");
      Assert (Tens (99) = 9, "Invalid tens of number");
      Assert (Tens (100) = 0, "Invalid tens of number");
      Assert (Tens (101) = 0, "Invalid tens of number");
      Assert (Tens (199) = 9, "Invalid tens of number");
      Assert (Tens (200) = 0, "Invalid tens of number");
      Assert (Tens (201) = 0, "Invalid tens of number");
      Assert (Tens (1_100) = 0, "Invalid tens of number");
      Assert (Tens (2_101) = 0, "Invalid tens of number");
      Assert (Tens (3_199) = 9, "Invalid tens of number");
      Assert (Tens (4_200) = 0, "Invalid tens of number");
      Assert (Tens (5_231) = 3, "Invalid tens of number");

      Assert (Tens (501) /= 2, "Invalid tens of number");
      Assert (Tens (601) /= 3, "Invalid tens of number");
   end Test_Tens;

   --------------------
   -- Test_Thousands --
   --------------------

   procedure Test_Thousands (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Thousands (0) = 0, "Invalid thousands of number");
      Assert (Thousands (5) = 0, "Invalid thousands of number");
      Assert (Thousands (10) = 0, "Invalid thousands of number");
      Assert (Thousands (11) = 0, "Invalid thousands of number");
      Assert (Thousands (21) = 0, "Invalid thousands of number");
      Assert (Thousands (99) = 0, "Invalid thousands of number");
      Assert (Thousands (100) = 0, "Invalid thousands of number");
      Assert (Thousands (101) = 0, "Invalid thousands of number");
      Assert (Thousands (199) = 0, "Invalid thousands of number");
      Assert (Thousands (200) = 0, "Invalid thousands of number");
      Assert (Thousands (1_201) = 1, "Invalid thousands of number");
      Assert (Thousands (5_100) = 5, "Invalid thousands of number");
      Assert (Thousands (42_101) = 2, "Invalid thousands of number");
      Assert (Thousands (33_199) = 3, "Invalid thousands of number");
      Assert (Thousands (24_200) = 4, "Invalid thousands of number");
      Assert (Thousands (15_231) = 5, "Invalid thousands of number");

      Assert (Thousands (4_501) /= 2, "Invalid thousands of number");
      Assert (Thousands (9_601) /= 3, "Invalid thousands of number");
   end Test_Thousands;

   -------------------------
   -- Test_To_Number_Char --
   -------------------------

   procedure Test_To_Number_Char (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (To_Number ('0') = 0, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('1') = 1, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('2') = 2, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('3') = 3, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('4') = 4, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('5') = 5, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('6') = 6, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('7') = 7, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('8') = 8, "Invalid conversion To_Number (Character)");
      Assert (To_Number ('9') = 9, "Invalid conversion To_Number (Character)");
   end Test_To_Number_Char;

   ---------------------------
   -- Test_To_Number_String --
   ---------------------------

   procedure Test_To_Number_String (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (To_Number ("0") = 0, "Invalid conversion To_Number (String)");
      Assert (To_Number ("1") = 1, "Invalid conversion To_Number (String)");
      Assert (To_Number ("2") = 2, "Invalid conversion To_Number (String)");
      Assert (To_Number ("33") = 33, "Invalid conversion To_Number (String)");
      Assert (To_Number ("45") = 45, "Invalid conversion To_Number (String)");
      Assert
        (To_Number ("523") = 523, "Invalid conversion To_Number (String)");
      Assert
        (To_Number ("678") = 678, "Invalid conversion To_Number (String)");
      Assert
        (To_Number ("725") = 725, "Invalid conversion To_Number (String)");
      Assert
        (To_Number ("86654") = 86_654,
         "Invalid conversion To_Number (String)");
      Assert
        (To_Number ("93434") = 93_434,
         "Invalid conversion To_Number (String)");
   end Test_To_Number_String;

   --------------------
   -- Test_To_String --
   --------------------

   procedure Test_To_String (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (To_String (0) = "0", "Invalid conversion to string");
      Assert (To_String (1) = "1", "Invalid conversion to string");
      Assert (To_String (2) = "2", "Invalid conversion to string");
      Assert (To_String (3) = "3", "Invalid conversion to string");
      Assert (To_String (12) = "12", "Invalid conversion to string");
      Assert (To_String (412) = "412", "Invalid conversion to string");
      Assert (To_String (7_126) = "7126", "Invalid conversion to string");
      Assert (To_String (167_299) = "167299", "Invalid conversion to string");
      Assert (To_String (01_212) = "1212", "Invalid conversion to string");
   end Test_To_String;

   ----------------
   -- Test_Units --
   ----------------

   procedure Test_Units (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Units (0) = 0, "Invalid units of number");
      Assert (Units (1) = 1, "Invalid units of number");
      Assert (Units (2) = 2, "Invalid units of number");
      Assert (Units (3) = 3, "Invalid units of number");
      Assert (Units (4) = 4, "Invalid units of number");
      Assert (Units (5) = 5, "Invalid units of number");
      Assert (Units (6) = 6, "Invalid units of number");
      Assert (Units (61) = 1, "Invalid units of number");
      Assert (Units (623) = 3, "Invalid units of number");
      Assert (Units (654) = 4, "Invalid units of number");
      Assert (Units (6_768) = 8, "Invalid units of number");
      Assert (Units (68_876) = 6, "Invalid units of number");
      null;
   end Test_Units;

end Numeric_Tests;
