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

with Crumbled_Natural_Tests; use Crumbled_Natural_Tests;
with Decimal_Division_Tests; use Decimal_Division_Tests;
with Divisors_Tests;         use Divisors_Tests;
with Factorial_Tests;        use Factorial_Tests;
with Fibonacci_Tests;        use Fibonacci_Tests;
with List_Tests;             use List_Tests;
with Numeric_Tests;          use Numeric_Tests;
with Prime_Tests;            use Prime_Tests;
with Set_Tests;              use Set_Tests;
with Sum_Tests;              use Sum_Tests;

package body Euler_Test_Suite is

   use AUnit.Test_Suites;

   Result : aliased Test_Suite;

   Crumbled_Natural_Test : aliased Crumbled_Natural_Test_Case;
   Decimal_Division_Test : aliased Decimal_Division_Test_Case;
   Divisors_Test         : aliased Divisors_Test_Case;
   Factorial_Test        : aliased Factorial_Test_Case;
   Fibonacci_Test        : aliased Fibonacci_Test_Case;
   List_Test             : aliased Lists_Test_Case;
   Numeric_Tests         : aliased Numeric_Test_Case;
   Prime_Test            : aliased Prime_Test_Case;
   Set_Tests             : aliased Set_Test_Case;
   Sum_Tests             : aliased Sum_Test_Case;

   -----------
   -- Suite --
   -----------

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Crumbled_Natural_Test'Access);
      Add_Test (Result'Access, Decimal_Division_Test'Access);
      Add_Test (Result'Access, Divisors_Test'Access);
      Add_Test (Result'Access, Factorial_Test'Access);
      Add_Test (Result'Access, Fibonacci_Test'Access);
      Add_Test (Result'Access, List_Test'Access);
      Add_Test (Result'Access, Numeric_Tests'Access);
      Add_Test (Result'Access, Prime_Test'Access);
      Add_Test (Result'Access, Set_Tests'Access);
      Add_Test (Result'Access, Sum_Tests'Access);
      return Result'Access;
   end Suite;

end Euler_Test_Suite;
