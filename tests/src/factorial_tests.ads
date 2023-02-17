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

package Factorial_Tests is
   type Factorial_Test_Case is new Test_Case with null record;

   overriding function Name (T : Factorial_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Factorial_Test_Case);

   procedure Test_Factorial (T : in out Test_Case'Class);
   procedure Test_Factorial_Int3 (T : in out Test_Case'Class);
   procedure Test_Combination (T : in out Test_Case'Class);

   procedure Test_Factorial_Error (T : in out Test_Case'Class);
   procedure Test_Factorial_Int3_Error (T : in out Test_Case'Class);

end Factorial_Tests;
