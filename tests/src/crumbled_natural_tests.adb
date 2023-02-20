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

with Euler_Tools; use Euler_Tools;
use Euler_Tools.Numeral_Package;

with Text_IO;

package body Crumbled_Natural_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name
     (T : Crumbled_Natural_Test_Case) return Test_String is
     (Format ("Crumbled_Natural Tests   "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Crumbled_Natural_Test_Case)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_CN_Type_Size'Access, "Type size");
      Register_Routine (T, Test_CN_Assign1'Access, "CN_Assign (CN, Int)");
      Register_Routine (T, Test_CN_Assign2'Access, "CN_Assign (Int, CN)");
      Register_Routine (T, Test_CN_Assign3'Access, "CN_Assign (Int, CN, <>)");
   end Register_Tests;

   -----------------------
   -- Test_CN_Type_Size --
   -----------------------

   procedure Test_CN_Type_Size (T : in out Test_Case'Class) is
      Number : Crumbled_Natural := CN_Empty;
   begin
      Text_IO.Put_Line ("   Numeral_Type'Size =" & Numeral_Type'Size'Image);
      Text_IO.Put_Line ("   CN_Empty'Size =" & CN_Empty'Size'Image);
      Text_IO.Put_Line ("   CN_Zero'Size =" & CN_Zero'Size'Image);
   end Test_CN_Type_Size;

   ---------------------
   -- Test_CN_Assign1 --
   ---------------------

   procedure Test_CN_Assign1 (T : in out Test_Case'Class) is
      Number : Crumbled_Natural := CN_Empty;
   begin
      CN_Assign (Number, 0);
      Assert (Number = CN_Zero, "Invalid crumbled natural");

      CN_Assign (Number, 1);
      Assert (Number = [1], "Invalid crumbled natural");

      CN_Assign (Number, 123);
      Assert (Number = [1, 2, 3], "Invalid crumbled natural");

      CN_Assign (Number, 0_001_234_567_890);
      Assert
        (Number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "Invalid crumbled natural");
   end Test_CN_Assign1;

   ---------------------
   -- Test_CN_Assign2 --
   ---------------------

   procedure Test_CN_Assign2 (T : in out Test_Case'Class) is
      Number : Integer_Type := 0;
   begin
      CN_Assign (Number, CN_Zero);
      Assert (Number = 0, "Invalid crumbled natural");

      CN_Assign (Number, [4]);
      Assert (Number = 4, "Invalid crumbled natural");

      CN_Assign (Number, [0, 1, 2, 3, 4]);
      Assert (Number = 1_234, "Invalid crumbled natural");
   end Test_CN_Assign2;

   ---------------------
   -- Test_CN_Assign3 --
   ---------------------

   procedure Test_CN_Assign3 (T : in out Test_Case'Class) is
      Number : Integer_Type := 0;
   begin
      CN_Assign (Number, [6], 1, 1);
      Assert (Number = 6, "Invalid crumbled natural");

      CN_Assign (Number, [6, 5, 4, 3, 2, 1], 1, 1);
      Assert (Number = 6, "Invalid crumbled natural");

      CN_Assign (Number, [6, 5, 4, 3, 2, 1], 1, 2);
      Assert (Number = 65, "Invalid crumbled natural");

      CN_Assign (Number, [6, 5, 4, 3, 2, 1], 2, 2);
      Assert (Number = 5, "Invalid crumbled natural");

      CN_Assign (Number, [6, 5, 4, 3, 2, 1], 3, 5);
      Assert (Number = 432, "Invalid crumbled natural");

      CN_Assign (Number, [6, 5, 4, 3, 2, 1], 6, 6);
      Assert (Number = 1, "Invalid crumbled natural");
   end Test_CN_Assign3;

end Crumbled_Natural_Tests;
