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

package body Lists_Tests is

   overriding function Name (T : Lists_Test_Case) return Test_String is
     (Format ("Lists Tests              "));

   overriding procedure Register_Tests (T : in out Lists_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Equals'Access, "Equals");
   end Register_Tests;

   procedure Test_Equals (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Equals ([1]), "Invalid Equals result");
      Assert (Equals ([2, 2]), "Invalid Equals result");
      Assert (Equals ([3, 3, 3, 3]), "Invalid Equals result");
      Assert (Equals ([4, 4, 4, 4, 4, 4, 4]), "Invalid Equals result");
      Assert
        (not Equals ([1, 1, 1, 1, 1, 2, 1, 1, 1]), "Invalid Equals result");
   end Test_Equals;

end Lists_Tests;
