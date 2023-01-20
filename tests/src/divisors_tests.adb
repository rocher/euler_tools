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

with AUnit.Assertions; use AUnit.Assertions;

with Euler_Tools;
with Euler_Int3_Tools;

with Text_IO; use Text_IO;

package body Divisors_Tests is

   overriding function Name (T : Divisors_Test_Case) return Test_String is
   begin
      return Format ("Divisors Tests      ");
   end Name;

   overriding procedure Register_Tests (T : in out Divisors_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_All_Divisors'Access, "All_Divisors");
      Register_Routine (T, Test_Are_Amicable'Access, "Are_Amicable");
      Register_Routine (T, Test_Is_Abundant'Access, "Is_Abundant");
      Register_Routine (T, Test_Is_Deficient'Access, "Is_Deficient");
      Register_Routine (T, Test_Is_Divisor'Access, "Is_Divisor");
      Register_Routine (T, Test_Is_Perfect'Access, "Is_Perfect");
      Register_Routine (T, Test_Proper_Divisors'Access, "Proper_Divisors");
   end Register_Tests;

   procedure Test_All_Divisors (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      null;
   end Test_All_Divisors;

   procedure Test_Are_Amicable (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      null;
   end Test_Are_Amicable;

   procedure Test_Is_Abundant (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      null;
   end Test_Is_Abundant;

   procedure Test_Is_Deficient (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      null;
   end Test_Is_Deficient;

   procedure Is_Divisor_By_Zero is
      use Euler_Tools;
   begin
      Assert (Is_Divisor (1, 0), "cannot divide by 0");
   end Is_Divisor_By_Zero;

   procedure Test_Is_Divisor (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert_Exception (Is_Divisor_By_Zero'Access, "cannot divide by 0");
      Assert (Is_Divisor (1, 1), "1 is evenly divisible by 1");
      Assert (Is_Divisor (2, 1), "2 is evenly divisible by 1");
      Assert (Is_Divisor (2, 2), "2 is evenly divisible by 2");
      Assert (Is_Divisor (3, 1), "3 is evenly divisible by 1");
      Assert (Is_Divisor (4, 1), "4 is evenly divisible by 1");
      Assert (Is_Divisor (4, 2), "4 is evenly divisible by 2");
      Assert (not Is_Divisor (4, 3), "4 is not evenly divisible by 3");
      Assert (Is_Divisor (4, 4), "4 is evenly divisible by 4");
      Assert (Is_Divisor (10, 1), "10 is evenly divisible by 1");
      Assert (Is_Divisor (10, 2), "10 is evenly divisible by 2");
      Assert (not Is_Divisor (10, 3), "10 is not evenly divisible by 3");
      Assert (not Is_Divisor (10, 4), "10 is not evenly divisible by 4");
      Assert (Is_Divisor (10, 5), "10 is evenly divisible by 5");
      Assert (not Is_Divisor (10, 6), "10 is not evenly divisible by 6");
      Assert (not Is_Divisor (10, 7), "10 is not evenly divisible by 7");
      Assert (not Is_Divisor (10, 8), "10 is not evenly divisible by 8");
      Assert (not Is_Divisor (10, 9), "10 is not evenly divisible by 9");
      Assert (Is_Divisor (10, 10), "10 is evenly divisible by 10");
      Assert (Is_Divisor (11, 1), "11 is evenly divisible by 1");
      Assert (not Is_Divisor (11, 2), "11 is not evenly divisible by 2");
      Assert (not Is_Divisor (11, 3), "11 is not evenly divisible by 3");
      Assert (not Is_Divisor (11, 4), "11 is not evenly divisible by 4");
      Assert (not Is_Divisor (11, 5), "11 is not evenly divisible by 5");
      Assert (not Is_Divisor (11, 6), "11 is not evenly divisible by 6");
      Assert (not Is_Divisor (11, 7), "11 is not evenly divisible by 7");
      Assert (not Is_Divisor (11, 8), "11 is not evenly divisible by 8");
      Assert (not Is_Divisor (11, 9), "11 is not evenly divisible by 9");
      Assert (not Is_Divisor (11, 10), "11 is not evenly divisible by 10");
      Assert (Is_Divisor (11, 11), "11 is evenly divisible by 11");
      Assert (not Is_Divisor (11, 12), "11 is not evenly divisible by 12");
      Assert (not Is_Divisor (11, 13), "11 is not evenly divisible by 13");
   end Test_Is_Divisor;

   procedure Test_Is_Perfect (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      null;
   end Test_Is_Perfect;

   procedure Test_Proper_Divisors (T : in out Test_Case'Class) is
   begin
      null;
   end Test_Proper_Divisors;

end Divisors_Tests;
