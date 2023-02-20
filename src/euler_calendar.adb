--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--   _____      _             _____           _
--  | ____|   _| | ___ _ __  |_   _|__   ___ | |___   Mathematical functions
--  |  _|| | | | |/ _ \ '__|   | |/ _ \ / _ \| / __|  and tools to solve
--  | |__| |_| | |  __/ |      | | (_) | (_) | \__ \  Project Euler problems
--  |_____\__,_|_|\___|_|      |_|\___/ \___/|_|___/  https://projecteuler.net
--
-- ----------------------------------------------------------------------------

package body Euler_Calendar is

   -------------
   -- Weekday --
   -------------

   function Weekday
     (Year : Natural; Month : Month_Type; Day : Natural) return Day_Type
   is
      Y : Natural          := Year;
      M : constant Natural := Month_Type'Enum_Rep (Month);
      D : Natural          := Day;
      E : Natural;
   begin
      if Month < Mar then
         D := @ + Y;
         Y := @ - 1;
      else
         D := @ + Y - 2;
      end if;
      E := ((23 * M / 9) + D + 4 + (Y / 4) - (Y / 100) + (Y / 400)) mod 7;
      return Day_Type'Enum_Val (E);
   end Weekday;

end Euler_Calendar;
