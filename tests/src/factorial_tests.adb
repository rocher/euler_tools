--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--   _____      _             _____           _       _____         _
--  | ____|   _| | ___ _ __  |_   _|__   ___ | |___  |_   _|__  ___| |_ ___
--  |  _|| | | | |/ _ \ '__|   | |/ _ \ / _ \| / __|   | |/ _ \/ __| __/ __|
--  | |__| |_| | |  __/ |      | | (_) | (_) | \__ \   | |  __/\__ \ |_\__ \
--  |_____\__,_|_|\___|_|      |_|\___/ \___/|_|___/   |_|\___||___/\__|___/
--
-- ----------------------------------------------------------------------------

--  pragma Suppress (Reference_Check);

with AUnit.Assertions; use AUnit.Assertions;
with Euler_Tools;
with Euler_Int3_Tools;

package body Factorial_Tests is

   overriding function Name (T : Factorial_Test_Case) return Test_String is
   begin
      return Format ("Factorial Tests     ");
   end Name;

   overriding procedure Register_Tests (T : in out Factorial_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Factorial'Access, "Factorial");
      Register_Routine (T, Test_Factorial_Int3'Access, "Factorial (Int3)");
      Register_Routine (T, Test_Combination'Access, "Combination");
   end Register_Tests;

   procedure Factorial_13 is
      use Euler_Tools;
      Result : constant Integer_Type := Factorial (13);
   begin
      null;
   end Factorial_13;

   procedure Test_Factorial (T : in out Test_Cases.Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Factorial (0) = 1, "0! is equal to 1");
      Assert (Factorial (1) = 1, "1! is equal to 1");
      Assert (Factorial (2) = 2, "2! is equal to 2");
      Assert (Factorial (3) = 6, "3! is equal to 6");
      Assert (Factorial (4) = 24, "4! is equal to 24");
      Assert (Factorial (5) = 120, "5! is equal to 120");
      Assert (Factorial (6) = 720, "6! is equal to 720");
      Assert (Factorial (7) = 5_040, "7! is equal to 5_040");
      Assert (Factorial (8) = 40_320, "8! is equal to 40_320");
      Assert (Factorial (9) = 362_880, "9! is equal to 362_880");
      Assert (Factorial (10) = 3_628_800, "10! is equal to 3_628_800");
      Assert (Factorial (11) = 39_916_800, "11! is equal to 39_916_800");
      Assert (Factorial (12) = 479_001_600, "12! is equal to 479_001_600");
      Assert_Exception
        (Factorial_13'Access, "13! should raise CONSTRAINT ERROR");
   end Test_Factorial;

   procedure Factorial_34 is
      use Euler_Tools;
      Result : constant Integer_Type := Factorial (34);
   begin
      null;
   end Factorial_34;

   procedure Test_Factorial_Int3 (T : in out Test_Cases.Test_Case'Class) is
      use Euler_Int3_Tools;
   begin
      Assert (Factorial (0) = 1, "0! is equal to 1");
      Assert (Factorial (1) = 1, "1! is equal to 1");
      Assert (Factorial (2) = 2, "2! is equal to 2");
      Assert (Factorial (3) = 6, "3! is equal to 6");
      Assert (Factorial (4) = 24, "4! is equal to 24");
      Assert (Factorial (5) = 120, "5! is equal to 120");
      Assert (Factorial (6) = 720, "6! is equal to 720");
      Assert (Factorial (7) = 5_040, "7! is equal to 5_040");
      Assert (Factorial (8) = 40_320, "8! is equal to 40_320");
      Assert (Factorial (9) = 362_880, "9! is equal to 362_880");
      Assert (Factorial (10) = 3_628_800, "10! is equal to 3_628_800");
      Assert (Factorial (11) = 39_916_800, "11! is equal to 39_916_800");
      Assert (Factorial (12) = 479_001_600, "12! is equal to 479_001_600");
      Assert
        (Factorial (20) = 2_432_902_008_176_640_000,
         "20! is equal to 2_432_902_008_176_640_000");
      Assert
        (Factorial (25) = 15_511_210_043_330_985_984_000_000,
         "20! is equal to 15_511_210_043_330_985_984_000_000");
      Assert
        (Factorial (33) = 8_683_317_618_811_886_495_518_194_401_280_000_000,
         "33! is equal to 8_683_317_618_811_886_495_518_194_401_280_000_000");
      Assert_Exception
        (Factorial_34'Access, "34! should raise CONSTRAINT ERROR");
   end Test_Factorial_Int3;

   procedure Test_Combination (T : in out Test_Cases.Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Combination (0, 0) = 1, "0 over 0 is equal to 1");
      Assert (Combination (1, 0) = 1, "1 over 0 is equal to 1");
      Assert (Combination (1, 1) = 1, "1 over 1 is equal to 1");
      Assert (Combination (2, 0) = 1, "2 over 0 is equal to 1");
      Assert (Combination (2, 1) = 2, "2 over 1 is equal to 2");
      Assert (Combination (2, 2) = 1, "2 over 2 is equal to 1");
      Assert (Combination (3, 0) = 1, "3 over 0 is equal to 1");
      Assert (Combination (3, 1) = 3, "3 over 1 is equal to 3");
      Assert (Combination (3, 2) = 3, "3 over 2 is equal to 3");
      Assert (Combination (3, 3) = 1, "3 over 3 is equal to 1");
      Assert (Combination (4, 0) = 1, "4 over 3 is equal to 1");
      Assert (Combination (4, 1) = 4, "4 over 3 is equal to 4");
      Assert (Combination (4, 2) = 6, "4 over 3 is equal to 6");
      Assert (Combination (4, 3) = 4, "4 over 3 is equal to 4");
      Assert (Combination (4, 4) = 1, "4 over 3 is equal to 1");
      Assert
        (Combination (8, 3) =
         Factorial (8) / (Factorial (8 - 3) * Factorial (3)),
         "8 over 3 is equal to 8!/(5!·3!)");
      Assert
        (Combination (12, 5) =
         Factorial (12) / (Factorial (12 - 5) * Factorial (5)),
         "12 over 5 is equal to 12!/(7!·5!)");
      Assert
        (Combination (12, 7) =
         Factorial (12) / (Factorial (12 - 7) * Factorial (7)),
         "12 over 7 is equal to 12!/(5!·7!)");
      Assert
        (Combination (12, 12) =
         Factorial (12) / (Factorial (12 - 12) * Factorial (12)),
         "12 over 12 is equal to 1");
   end Test_Combination;

end Factorial_Tests;
