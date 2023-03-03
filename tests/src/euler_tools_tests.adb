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

with Ada.Command_Line;
with Ada.Containers;
with Ada.Text_IO;

with AUnit.Run;
with AUnit.Reporter.Text;
with AUnit.Test_Results;

with Euler_Test_Suite;
with Euler_Tools_Tests_Config; use Euler_Tools_Tests_Config;
with Euler_Tools;

procedure Euler_Tools_Tests is

   procedure Run is new AUnit.Run.Test_Runner_With_Results
     (Euler_Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
   Results  : AUnit.Test_Results.Result;

begin
   Ada.Text_IO.Put_Line
     ("   " & Euler_Tools.Library_Name & " = " & Euler_Tools.Library_Version);

   Reporter.Set_Use_ANSI_Colors (Build_Profile = development);
   Run (Reporter, Results);

   if not Results.Successful then
      Ada.Command_Line.Set_Exit_Status (1);
   end if;

end Euler_Tools_Tests;
