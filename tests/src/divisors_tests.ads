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

with AUnit;            use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package Divisors_Tests is
   type Divisors_Test_Case is new Test_Case with null record;

   overriding function Name (T : Divisors_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Divisors_Test_Case);

   procedure Test_All_Divisors (T : in out Test_Case'Class);
   procedure Test_Are_Amicable (T : in out Test_Case'Class);
   procedure Test_Is_Abundant (T : in out Test_Case'Class);
   procedure Test_Is_Deficient (T : in out Test_Case'Class);
   procedure Test_Is_Divisor (T : in out Test_Case'Class);
   procedure Test_Is_Perfect (T : in out Test_Case'Class);
   procedure Test_Proper_Divisors (T : in out Test_Case'Class);

   procedure Test_Int3_Is_Perfect (T : in out Test_Case'Class);

end Divisors_Tests;
