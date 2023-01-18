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

with Fibonacci_Tests; use Fibonacci_Tests;
with Prime_Tests;     use Prime_Tests;

package body Euler_Test_Suite is

   use AUnit.Test_Suites;

   Result : aliased Test_Suite;

   Fibonacci_Test_1 : aliased Fibonacci_Test_Case;
   Prime_Test_1     : aliased Prime_Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Fibonacci_Test_1'Access);
      Add_Test (Result'Access, Prime_Test_1'Access);
      return Result'Access;
   end Suite;

end Euler_Test_Suite;