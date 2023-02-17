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

package Euler_Calendar is

   type Month_Type is
     (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
   for Month_Type use
     (Jan => 1, Feb => 2, Mar => 3, Apr => 4, May => 5, Jun => 6, Jul => 7,
      Aug => 8, Sep => 9, Oct => 10, Nov => 11, Dec => 12);

   type Day_Type is (Sun, Mon, Tue, Wed, Thu, Fri, Sat);
   for Day_Type use
     (Sun => 0, Mon => 1, Tue => 2, Wed => 3, Thu => 4, Fri => 5, Sat => 6);

   function Weekday
     (Year : Natural; Month : Month_Type; Day : Natural) return Day_Type;
   --  Returns the day of the week of Year, Month Day.

end Euler_Calendar;
