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

package Crumbled_Natural_Tests is
   type Crumbled_Natural_Test_Case is new Test_Case with null record;

   overriding function Name
     (T : Crumbled_Natural_Test_Case) return Message_String;

   overriding procedure Register_Tests (T : in out Crumbled_Natural_Test_Case);

   procedure Test_CN_Type_Size (T : in out Test_Case'Class);
   procedure Test_CN_Assign1 (T : in out Test_Case'Class);
   procedure Test_CN_Assign2 (T : in out Test_Case'Class);
   procedure Test_CN_Assign3 (T : in out Test_Case'Class);

end Crumbled_Natural_Tests;
