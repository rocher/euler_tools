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

with AUnit;            use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package Prime_Tests is
   type Prime_Test_Case is new Test_Case with null record;

   overriding function Name (T : Prime_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Prime_Test_Case);

   procedure Test_Is_Prime (T : in out Test_Case'Class);
   procedure Test_Prime_Factors (T : in out Test_Case'Class);
   procedure Test_Prime_Generator (T : in out Test_Case'Class);
   procedure Test_Prime_Nth (T : in out Test_Case'Class);

end Prime_Tests;
