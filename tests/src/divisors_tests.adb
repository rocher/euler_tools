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

with Euler_Tools;
with Euler_Tools_Int3;

package body Divisors_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Divisors_Test_Case) return Test_String is
     (Format ("Divisors Tests           "));

   --------------------
   -- Register_Tests --
   --------------------

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
      Register_Routine (T, Test_Int3_Is_Perfect'Access, "Is_Perfect (Int3)");
   end Register_Tests;

   -----------------------
   -- Test_All_Divisors --
   -----------------------

   procedure Test_All_Divisors (T : in out Test_Case'Class) is
      use Euler_Tools;
      use Set_Package;
      Divisors_Set : Set_Type := Empty_Set;
   begin
      Divisors_Set.Insert (1);
      Assert (All_Divisors (1) = Divisors_Set, "Incorrect divisors of 1");

      Divisors_Set.Insert (3);
      Assert (All_Divisors (3) = Divisors_Set, "Incorrect divisors of 3");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Divisors_Set.Insert (5);
      Assert (All_Divisors (5) = Divisors_Set, "Incorrect divisors of 5");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Divisors_Set.Insert (7);
      Assert (All_Divisors (7) = Divisors_Set, "Incorrect divisors of 7");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Divisors_Set.Insert (11);
      Assert (All_Divisors (11) = Divisors_Set, "Incorrect divisors of 11");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Divisors_Set.Insert (2);
      Assert (All_Divisors (2) = Divisors_Set, "Incorrect divisors of 2");

      Divisors_Set.Insert (4);
      Assert (All_Divisors (4) = Divisors_Set, "Incorrect divisors of 4");

      Divisors_Set.Insert (5);
      Divisors_Set.Insert (10);
      Divisors_Set.Insert (20);
      Assert (All_Divisors (20) = Divisors_Set, "Incorrect divisors of 20");

      Divisors_Set.Insert (25);
      Divisors_Set.Insert (50);
      Divisors_Set.Insert (100);
      Assert (All_Divisors (100) = Divisors_Set, "Incorrect divisors of 100");

      Divisors_Set.Insert (8);
      Divisors_Set.Insert (40);
      Divisors_Set.Insert (200);
      Assert (All_Divisors (200) = Divisors_Set, "Incorrect divisors of 200");
   end Test_All_Divisors;

   -----------------------
   -- Test_Are_Amicable --
   -----------------------

   procedure Test_Are_Amicable (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Are_Amicable (220, 284), "220 and 284 are amicable");
      Assert (Are_Amicable (284, 220), "284 and 220 are amicable");
      Assert (Are_Amicable (1_184, 1_210), "1_184 and 1_210 are amicable");
      Assert (Are_Amicable (2_620, 2_924), "2_620 and 2_924 are amicable");
      Assert (Are_Amicable (5_020, 5_564), "5_020 and 5_564 are amicable");
      Assert (Are_Amicable (6_232, 6_368), "6_232 and 6_368 are amicable");
      Assert (Are_Amicable (10_744, 10_856), "10_744 and 10_856 are amicable");
      Assert (Are_Amicable (12_285, 14_595), "12_285 and 14_595 are amicable");
      Assert (Are_Amicable (17_296, 18_416), "17_296 and 18_416 are amicable");
      Assert (Are_Amicable (63_020, 76_084), "63_020 and 76_084 are amicable");
      Assert (Are_Amicable (66_928, 66_992), "66_928 and 66_992 are amicable");

      Assert (not Are_Amicable (123, 139), "123 and 139 are not amicable");
      Assert (not Are_Amicable (334, 412), "334 and 412 are not amicable");
      Assert (not Are_Amicable (524, 539), "523 and 539 are not amicable");
      Assert (not Are_Amicable (672, 716), "672 and 716 are not amicable");
   end Test_Are_Amicable;

   ----------------------
   -- Test_Is_Abundant --
   ----------------------

   procedure Test_Is_Abundant (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Is_Abundant (12), "12 is an abundant number");
      Assert (Is_Abundant (18), "18 is an abundant number");
      Assert (Is_Abundant (20), "20 is an abundant number");
      Assert (Is_Abundant (24), "24 is an abundant number");
      Assert (Is_Abundant (30), "30 is an abundant number");
      Assert (Is_Abundant (36), "36 is an abundant number");
      Assert (Is_Abundant (40), "40 is an abundant number");
      Assert (Is_Abundant (42), "42 is an abundant number");
      Assert (Is_Abundant (48), "48 is an abundant number");
      Assert (Is_Abundant (54), "54 is an abundant number");
      Assert (Is_Abundant (56), "56 is an abundant number");
      Assert (Is_Abundant (60), "60 is an abundant number");
      Assert (Is_Abundant (66), "66 is an abundant number");
      Assert (Is_Abundant (70), "70 is an abundant number");
      Assert (Is_Abundant (72), "72 is an abundant number");
      Assert (Is_Abundant (78), "78 is an abundant number");
      Assert (Is_Abundant (80), "80 is an abundant number");
      Assert (Is_Abundant (84), "84 is an abundant number");
      Assert (Is_Abundant (88), "88 is an abundant number");
      Assert (Is_Abundant (90), "90 is an abundant number");
      Assert (Is_Abundant (96), "96 is an abundant number");
      Assert (Is_Abundant (100), "100 is an abundant number");
      Assert (Is_Abundant (102), "102 is an abundant number");
      Assert (Is_Abundant (104), "104 is an abundant number");
      Assert (Is_Abundant (108), "108 is an abundant number");
      Assert (Is_Abundant (112), "112 is an abundant number");
      Assert (Is_Abundant (114), "114 is an abundant number");
      Assert (Is_Abundant (120), "120 is an abundant number");

      Assert (not Is_Abundant (10), "10 is not an abundant number");
      Assert (not Is_Abundant (11), "11 is not an abundant number");
      Assert (not Is_Abundant (16), "16 is not an abundant number");
      Assert (not Is_Abundant (17), "17 is not an abundant number");
      Assert (not Is_Abundant (19), "19 is not an abundant number");
      Assert (not Is_Abundant (21), "21 is not an abundant number");
      Assert (not Is_Abundant (22), "22 is not an abundant number");
      Assert (not Is_Abundant (23), "23 is not an abundant number");
   end Test_Is_Abundant;

   -----------------------
   -- Test_Is_Deficient --
   -----------------------

   procedure Test_Is_Deficient (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Is_Deficient (1), "1 is a deficient number");
      Assert (Is_Deficient (2), "2 is a deficient number");
      Assert (Is_Deficient (3), "3 is a deficient number");
      Assert (Is_Deficient (4), "4 is a deficient number");
      Assert (Is_Deficient (5), "5 is a deficient number");
      Assert (not Is_Deficient (6), "6 is not a deficient number");
      Assert (Is_Deficient (7), "7 is a deficient number");
      Assert (Is_Deficient (8), "8 is a deficient number");
      Assert (Is_Deficient (9), "9 is a deficient number");
      Assert (Is_Deficient (10), "10 is a deficient number");
      Assert (Is_Deficient (11), "11 is a deficient number");
      Assert (not Is_Deficient (12), "12 is not a deficient number");
      Assert (Is_Deficient (13), "13 is a deficient number");
      Assert (Is_Deficient (14), "14 is a deficient number");
      Assert (Is_Deficient (15), "15 is a deficient number");
      Assert (Is_Deficient (16), "16 is a deficient number");
      Assert (Is_Deficient (17), "17 is a deficient number");
      Assert (not Is_Deficient (18), "18 is not a deficient number");
      Assert (Is_Deficient (19), "19 is a deficient number");
      Assert (not Is_Deficient (20), "20 is not a deficient number");
      Assert (Is_Deficient (21), "21 is a deficient number");
      Assert (Is_Deficient (22), "22 is a deficient number");
      Assert (Is_Deficient (23), "23 is a deficient number");
      Assert (not Is_Deficient (24), "24 is not a deficient number");
      Assert (Is_Deficient (25), "25 is a deficient number");
      Assert (Is_Deficient (26), "26 is a deficient number");
      Assert (Is_Deficient (27), "27 is a deficient number");
      Assert (not Is_Deficient (28), "28 is not a deficient number");
      Assert (Is_Deficient (29), "29 is a deficient number");
      Assert (not Is_Deficient (30), "30 is not a deficient number");
      Assert (Is_Deficient (31), "31 is a deficient number");
      Assert (Is_Deficient (32), "32 is a deficient number");
      Assert (Is_Deficient (33), "33 is a deficient number");
      Assert (Is_Deficient (34), "34 is a deficient number");
      Assert (Is_Deficient (35), "35 is a deficient number");
      Assert (not Is_Deficient (36), "36 is not a deficient number");
      Assert (Is_Deficient (37), "37 is a deficient number");
      Assert (Is_Deficient (38), "38 is a deficient number");
      Assert (Is_Deficient (39), "39 is a deficient number");
      Assert (not Is_Deficient (40), "40 is not a deficient number");
      Assert (Is_Deficient (41), "41 is a deficient number");
      Assert (not Is_Deficient (42), "42 is not a deficient number");
      Assert (Is_Deficient (43), "43 is a deficient number");
      Assert (Is_Deficient (44), "44 is a deficient number");
      Assert (Is_Deficient (45), "45 is a deficient number");
      Assert (Is_Deficient (46), "46 is a deficient number");
      Assert (Is_Deficient (47), "47 is a deficient number");
      Assert (not Is_Deficient (48), "48 is not a deficient number");
      Assert (Is_Deficient (49), "49 is a deficient number");
      Assert (Is_Deficient (50), "50 is a deficient number");
   end Test_Is_Deficient;

   ------------------------
   -- Is_Divisor_By_Zero --
   ------------------------

   procedure Is_Divisor_By_Zero is
      use Euler_Tools;
   begin
      Assert (Is_Divisor (1, 0), "cannot divide by 0");
   end Is_Divisor_By_Zero;

   ---------------------
   -- Test_Is_Divisor --
   ---------------------

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

   ---------------------
   -- Test_Is_Perfect --
   ---------------------

   procedure Test_Is_Perfect (T : in out Test_Case'Class) is
      use Euler_Tools;
   begin
      Assert (Is_Perfect (6), "6 is a perfect number");
      Assert (Is_Perfect (28), "28 is a perfect number");
      Assert (Is_Perfect (496), "496 is a perfect number");
      Assert (Is_Perfect (8_128), "8_128 is a perfect number");
      Assert (Is_Perfect (33_550_336), "33_550_336 is a perfect number");

      Assert (not Is_Perfect (5), "5 is not a perfect number");
      Assert (not Is_Perfect (7), "7 is not a perfect number");
      Assert (not Is_Perfect (8), "8 is not a perfect number");
      Assert (not Is_Perfect (26), "26 is not a perfect number");
      Assert (not Is_Perfect (27), "27 is not a perfect number");
      Assert (not Is_Perfect (29), "29 is not a perfect number");
      Assert (not Is_Perfect (30), "30 is not a perfect number");
   end Test_Is_Perfect;

   --------------------------
   -- Test_Proper_Divisors --
   --------------------------

   procedure Test_Proper_Divisors (T : in out Test_Case'Class) is
      use Euler_Tools;
      use Set_Package;
      Divisors_Set : Set := Empty_Set;
   begin
      Assert
        (Proper_Divisors (1) = Divisors_Set, "Incorrect proper divisors of 1");

      Divisors_Set.Insert (1);
      Assert
        (Proper_Divisors (3) = Divisors_Set, "Incorrect proper divisors of 3");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Assert
        (Proper_Divisors (5) = Divisors_Set, "Incorrect proper divisors of 5");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Assert
        (Proper_Divisors (7) = Divisors_Set, "Incorrect proper divisors of 7");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Assert
        (Proper_Divisors (11) = Divisors_Set,
         "Incorrect proper divisors of 11");

      Divisors_Set.Clear;
      Divisors_Set.Insert (1);
      Assert
        (Proper_Divisors (2) = Divisors_Set, "Incorrect proper divisors of 2");

      Divisors_Set.Insert (2);
      Assert
        (Proper_Divisors (4) = Divisors_Set, "Incorrect proper divisors of 4");

      Divisors_Set.Insert (4);
      Divisors_Set.Insert (5);
      Divisors_Set.Insert (10);
      Assert
        (Proper_Divisors (20) = Divisors_Set,
         "Incorrect proper divisors of 20");

      Divisors_Set.Insert (20);
      Divisors_Set.Insert (25);
      Divisors_Set.Insert (50);
      Assert
        (Proper_Divisors (100) = Divisors_Set,
         "Incorrect proper divisors of 100");

      Divisors_Set.Insert (8);
      Divisors_Set.Insert (40);
      Divisors_Set.Insert (100);
      Assert
        (Proper_Divisors (200) = Divisors_Set,
         "Incorrect proper divisors of 200");
   end Test_Proper_Divisors;

   --------------------------
   -- Test_Int3_Is_Perfect --
   --------------------------

   procedure Test_Int3_Is_Perfect (T : in out Test_Case'Class) is
      use Euler_Tools_Int3;
   begin
      Assert (Is_Perfect (8_589_869_056), "8_589_869_056 is a perfect number");

      --  These take too much time:
      --  Assert
      --    (Is_Perfect (2_305_843_008_139_952_128),
      --     "2_305_843_008_139_952_128 is a perfect number");
      --  Assert
      --    (Is_Perfect (2_658_455_991_569_831_744_654_692_615_953_842_176),
      --     "2_658_455_991_569_831_744_654_692_615_953_842_176" &
      --     " is a perfect number");

      Assert
        (not Is_Perfect (7_589_869_056),
         "7_589_869_056 is not a perfect number");
      Assert
        (not Is_Perfect (8_453_869_056),
         "8_453_869_056 is not a perfect number");
   end Test_Int3_Is_Perfect;

end Divisors_Tests;
