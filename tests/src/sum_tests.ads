--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: MIT
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

package Sum_Tests is
   type Sum_Test_Case is new Test_Case with null record;

   overriding function Name (T : Sum_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Sum_Test_Case);

   procedure Test_Sum_Multiples (T : in out Test_Case'Class);
   procedure Test_Sum_Sequence (T : in out Test_Case'Class);
   procedure Test_Sum_Squares (T : in out Test_Case'Class);

end Sum_Tests;
