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

package body Fibonacci_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Fibonacci_Test_Case) return Test_String is
     (Format ("Fibonacci Tests          "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Fibonacci_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine
        (T, Test_Fibonacci'Access, "Fibonacci_Start, Fibonacci_Next");
   end Register_Tests;

   --------------------
   -- Test_Fibonacci --
   --------------------

   procedure Test_Fibonacci (T : in out Test_Cases.Test_Case'Class) is
      Number : Integer_Type;
   begin
      Number := Fibonacci_Start;
      Assert (Number = 2, "Invalid first generated Fibonacci number");

      Number := Fibonacci_Next;
      Assert (Number = 3, "Invalid second generated Fibonacci number");

      Number := Fibonacci_Next;
      Assert (Number = 5, "Invalid third generated Fibonacci number");

      for i in 4 .. 10 loop
         Number := Fibonacci_Next;
      end loop;
      Assert (Number = 144, "Invalid tenth generated Fibonacci number");
   end Test_Fibonacci;

end Fibonacci_Tests;
