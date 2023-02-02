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
with Euler_Tools;      use Euler_Tools;

package body Prime_Tests is

   overriding function Name (T : Prime_Test_Case) return Test_String is
     (Format ("Prime Tests              "));

   overriding procedure Register_Tests (T : in out Prime_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Is_Prime'Access, "Is_Prime");
      Register_Routine
        (T, Test_Prime_Generator'Access, "Prime_First, Prime_Next");
      Register_Routine (T, Test_Prime_Nth'Access, "Prime_Nth");
   end Register_Tests;

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

   procedure Test_Prime_Generator (T : in out Test_Cases.Test_Case'Class) is
      Number : Integer_Type;
   begin
      Number := Prime_First;
      Assert (Number = 2, "Invalid first Prime number");

      Number := Prime_Next;
      Assert (Number = 3, "Invalid second Prime number");

      Number := Prime_Next;
      Assert (Number = 5, "Invalid third Prime number");

      for i in 4 .. 10 loop
         Number := Prime_Next;
      end loop;
      Assert (Number = 29, "Invalid tenth Prime number");

      for i in 11 .. 20 loop
         Number := Prime_Next;
      end loop;
      Assert (Number = 71, "Invalid tenth Prime number");

      for i in 21 .. 10_001 loop
         Number := Prime_Next;
      end loop;
      Assert (Number = 104_743, "Invalid tenth Prime number");
   end Test_Prime_Generator;

   procedure Test_Prime_Nth (T : in out Test_Case'Class) is
   begin
      Assert (Prime_Nth (1) = 2, "2 is the 1st prime number");
      Assert (Prime_Nth (2) = 3, "3 is the 2nd prime number");
      Assert (Prime_Nth (3) = 5, "5 is the 3rd prime number");
      Assert (Prime_Nth (4) = 7, "7 is the 4th prime number");
      Assert (Prime_Nth (5) = 11, "11 is the 5th prime number");
      Assert (Prime_Nth (6) = 13, "13 is the 6th prime number");
      Assert (Prime_Nth (7) = 17, "17 is the 7th prime number");
      Assert (Prime_Nth (8) = 19, "19 is the 8th prime number");
      Assert (Prime_Nth (9) = 23, "23 is the 9th prime number");
      Assert (Prime_Nth (10) = 29, "29 is the 10th prime number");
      Assert
        (Prime_Nth (10_001) = 104_743, "104_743 is the 10_001 prime number");
   end Test_Prime_Nth;

end Prime_Tests;
