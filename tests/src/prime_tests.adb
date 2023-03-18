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
      Number : Integer_Type;
      Cursor : Prime_Cursor_Type;
   begin
      Number := Prime_First (Cursor);
      Assert (Number = 2, "Invalid first Prime number");

      Number := Prime_Next (Cursor);
      Assert (Number = 3, "Invalid second Prime number");

      Number := Prime_Next (Cursor);
      Assert (Number = 5, "Invalid third Prime number");

      for i in 4 .. 10 loop
         Number := Prime_Next (Cursor);
      end loop;
      Assert (Number = 29, "Invalid tenth Prime number");

      for i in 11 .. 20 loop
         Number := Prime_Next (Cursor);
      end loop;
      Assert (Number = 71, "Invalid tenth Prime number");

      for i in 21 .. 10_001 loop
         Number := Prime_Next (Cursor);
      end loop;
      Assert (Number = 104_743, "Invalid tenth Prime number");
   end Test_Prime_Generator;

   --------------------
   -- Test_Prime_Nth --
   --------------------

   procedure Test_Prime_Nth (T : in out Test_Case'Class) is
      Cursor : Prime_Cursor_Type;
   begin
      Assert (Prime_Nth (Cursor, 1) = 2, "2 is the 1st prime number");
      Assert (Prime_Nth (Cursor, 2) = 3, "3 is the 2nd prime number");
      Assert (Prime_Nth (Cursor, 3) = 5, "5 is the 3rd prime number");
      Assert (Prime_Nth (Cursor, 4) = 7, "7 is the 4th prime number");
      Assert (Prime_Nth (Cursor, 5) = 11, "11 is the 5th prime number");
      Assert (Prime_Nth (Cursor, 6) = 13, "13 is the 6th prime number");
      Assert (Prime_Nth (Cursor, 7) = 17, "17 is the 7th prime number");
      Assert (Prime_Nth (Cursor, 8) = 19, "19 is the 8th prime number");
      Assert (Prime_Nth (Cursor, 9) = 23, "23 is the 9th prime number");
      Assert (Prime_Nth (Cursor, 10) = 29, "29 is the 10th prime number");
      Assert
        (Prime_Nth (Cursor, 10_001) = 104_743,
         "104_743 is the 10_001 prime number");
   end Test_Prime_Nth;

end Prime_Tests;
