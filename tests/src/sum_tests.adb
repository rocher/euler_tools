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

package body Sum_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Sum_Test_Case) return Test_String is
     (Format ("Sum Tests                "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Sum_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Sum_Multiples'Access, "Sum_Multiples");
      Register_Routine (T, Test_Sum_Sequence'Access, "Sum_Sequence");
      Register_Routine (T, Test_Sum_Squares'Access, "Sum_Squares");
   end Register_Tests;

   ------------------------
   -- Test_Sum_Multiples --
   ------------------------

   procedure Test_Sum_Multiples (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Sum_Multiples (2, 2) = 2, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (2, 4) = 6, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (2, 8) = 20, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (3, 3) = 3, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (3, 6) = 9, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (3, 9) = 18, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (5, 5) = 5, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (5, 10) = 15, "Invalid Sum_Multiples result");
      Assert (Sum_Multiples (5, 100) = 1_050, "Invalid Sum_Multiples result");
   end Test_Sum_Multiples;

   -----------------------
   -- Test_Sum_Sequence --
   -----------------------

   procedure Test_Sum_Sequence (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Sum_Sequence (1) = 1, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (2) = 3, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (3) = 6, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (4) = 10, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (5) = 15, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (100) = 5_050, "Invalid Sum_Sequence result");
      Assert (Sum_Sequence (1_000) = 500_500, "Invalid Sum_Sequence result");
   end Test_Sum_Sequence;

   ----------------------
   -- Test_Sum_Squares --
   ----------------------

   procedure Test_Sum_Squares (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Sum_Squares (1) = 1, "Invalid Sum_Squares result");
      Assert (Sum_Squares (2) = 5, "Invalid Sum_Squares result");
      Assert (Sum_Squares (3) = 14, "Invalid Sum_Squares result");
      Assert (Sum_Squares (4) = 30, "Invalid Sum_Squares result");
      Assert (Sum_Squares (5) = 55, "Invalid Sum_Squares result");
      Assert (Sum_Squares (10) = 385, "Invalid Sum_Squares result");
      Assert (Sum_Squares (100) = 338_350, "Invalid Sum_Squares result");
      Assert (Sum_Squares (500) = 41_791_750, "Invalid Sum_Squares result");
   end Test_Sum_Squares;

end Sum_Tests;
