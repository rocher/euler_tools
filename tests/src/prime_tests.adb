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

package body Prime_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Prime_Test_Case) return Test_String is
     (Format ("Prime Tests              "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Prime_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Is_Prime'Access, "Is_Prime");
      Register_Routine (T, Test_Prime_Factors'Access, "Prime_Factors");
      Register_Routine
        (T, Test_Prime_Generator'Access, "Prime_First, Prime_Next");
      Register_Routine (T, Test_Prime_Nth'Access, "Prime_Nth");
   end Register_Tests;

   -------------------
   -- Test_Is_Prime --
   -------------------

   procedure Test_Is_Prime (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Is_Prime (2), "2 is a prime number");
      Assert (Is_Prime (3), "3 is a prime number");
      Assert (not Is_Prime (4), "4 is not a prime number");
      Assert (Is_Prime (5), "5 is a prime number");
      Assert (not Is_Prime (6), "6 is not a prime number");
      Assert (Is_Prime (7), "7 is a prime number");
      Assert (not Is_Prime (8), "8 is not a prime number");
      Assert (not Is_Prime (9), "9 is not a prime number");
      Assert (not Is_Prime (10), "10 is not a prime number");
      Assert (Is_Prime (11), "11 is a prime number");
      Assert (not Is_Prime (12), "12 is not a prime number");
      Assert (Is_Prime (13), "13 is a prime number");
      Assert (not Is_Prime (14), "14 is not a prime number");
      Assert (not Is_Prime (15), "15 is not a prime number");
      Assert (not Is_Prime (16), "16 is not a prime number");
      Assert (Is_Prime (17), "17 is a prime number");
      Assert (not Is_Prime (18), "18 is not a prime number");
      Assert (Is_Prime (19), "19 is a prime number");
      Assert (not Is_Prime (20), "20 is not a prime number");
   end Test_Is_Prime;

   ------------------------
   -- Test_Prime_Factors --
   ------------------------

   procedure Test_Prime_Factors (T : in out Test_Cases.Test_Case'Class) is
      use List_Package;
   begin
      Assert (Prime_Factors (2) = [2], "Invalid list of prime factors");
      Assert (Prime_Factors (3) = [3], "Invalid list of prime factors");
      Assert (Prime_Factors (5) = [5], "Invalid list of prime factors");
      Assert (Prime_Factors (7) = [7], "Invalid list of prime factors");
      Assert (Prime_Factors (11) = [11], "Invalid list of prime factors");
      Assert (Prime_Factors (23) = [23], "Invalid list of prime factors");

      Assert (Prime_Factors (4) = [2, 2], "Invalid list of prime factors");
      Assert (Prime_Factors (6) = [2, 3], "Invalid list of prime factors");
      Assert (Prime_Factors (8) = [2, 2, 2], "Invalid list of prime factors");
      Assert (Prime_Factors (9) = [3, 3], "Invalid list of prime factors");
      Assert (Prime_Factors (10) = [2, 5], "Invalid list of prime factors");
      Assert (Prime_Factors (12) = [2, 2, 3], "Invalid list of prime factors");
      Assert (Prime_Factors (14) = [2, 7], "Invalid list of prime factors");

      Assert
        (Prime_Factors (2 * 3 * 3 * 5 * 5 * 7) = [2, 3, 3, 5, 5, 7],
         "Invalid list of prime factors");
      Assert
        (Prime_Factors (2 * 2 * 3 * 3 * 3 * 3 * 3 * 7 * 11 * 23) =
         [2, 2, 3, 3, 3, 3, 3, 7, 11, 23],
         "Invalid list of prime factors");
      Assert
        (Prime_Factors (3 * 7 * 11 * 23 * 23 * 41 * 41) =
         [3, 7, 11, 23, 23, 41, 41],
         "Invalid list of prime factors");
   end Test_Prime_Factors;

   --------------------------
   -- Test_Prime_Generator --
   --------------------------

   procedure Test_Prime_Generator (T : in out Test_Cases.Test_Case'Class) is
      Cursor : Prime_Cursor_Type;
   begin
      Assert (Prime_First (Cursor) = 2, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 3, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 5, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 7, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 11, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 13, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 17, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 19, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 23, "Invalid prime number");
      Assert (Prime_Next (Cursor) = 29, "Invalid prime number");

      Assert (Prime_First (Cursor) = 2, "Invalid prime number");
      Assert (Prime_Next (Cursor, 1) = 3, "Invalid prime number");
      Assert (Prime_Next (Cursor, 2) = 7, "Invalid prime number");
      Assert (Prime_Next (Cursor, 3) = 17, "Invalid prime number");
      Assert (Prime_Next (Cursor, 3) = 29, "Invalid prime number");
      Assert (Prime_Next (Cursor, 10) = 71, "Invalid prime number");
      Assert (Prime_Next (Cursor, 9_981) = 104_743, "Invalid prime number");
   end Test_Prime_Generator;

   --------------------
   -- Test_Prime_Nth --
   --------------------

   procedure Test_Prime_Nth (T : in out Test_Case'Class) is
   begin
      Assert (Prime_Nth (1) = 2, "Invalid prime number");
      Assert (Prime_Nth (2) = 3, "Invalid prime number");
      Assert (Prime_Nth (3) = 5, "Invalid prime number");
      Assert (Prime_Nth (4) = 7, "Invalid prime number");
      Assert (Prime_Nth (5) = 11, "Invalid prime number");
      Assert (Prime_Nth (6) = 13, "Invalid prime number");
      Assert (Prime_Nth (7) = 17, "Invalid prime number");
      Assert (Prime_Nth (8) = 19, "Invalid prime number");
      Assert (Prime_Nth (9) = 23, "Invalid prime number");
      Assert (Prime_Nth (10) = 29, "Invalid prime number");
      Assert (Prime_Nth (10_001) = 104_743, "Invalid prime number");
   end Test_Prime_Nth;

end Prime_Tests;
