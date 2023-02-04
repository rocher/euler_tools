--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--   _____      _             _____           _
--  | ____|   _| | ___ _ __  |_   _|__   ___ | |___   Mathematical functions
--  |  _|| | | | |/ _ \ '__|   | |/ _ \ / _ \| / __|  and tools to solve
--  | |__| |_| | |  __/ |      | | (_) | (_) | \__ \  Project Euler problems
--  |_____\__,_|_|\___|_|      |_|\___/ \___/|_|___/  https://projecteuler.net
--
-- ----------------------------------------------------------------------------

--  For example, if Dividend = 2, Divisor = 5 and Decimals = 7, the returned
--  values are Dividend = 2, Divisor = 5, Quotient = 0, Decimals = [4],
--  Remainder = 0 and Cycle = 0. Decimals are positions in quotient between
--  zero and one (Quotient is always integer); Cycle indicates the position
--  in Decimals where recurring cycle starts.
--
--                                         0.4
--            20  |_5____      or        ------
--             0    0.4                5 | 2
--                                         0
--                                         --
--                                         20
--                                         20
--                                         --
--                                          0
--
--  For example, 63322/195 = 324.72(820512). Calling Detailed_Division with
--  Dividend = 63322, Divisor = 195 and Decimals = 2, the result would be
--  Dividend = 63322, Divisor = 192, Quotient = 324, Decimals = [7, 2]
--  (vector of numerals), Cycle = 0 and Remainder = 160. That's equivalent
--  to:
--
--                                              0032
--       63322  |_195____      or             ---------
--        482     324.72                  195 | 63322
--         922                                  0
--         1420                                 --
--           550                                63
--           160                                 0
--                                              --
--                                              633
--                                              585
--                                              ---
--                                               482
--                                               ...
--
--  For the operation Detailed_Division (63322, 195, 12), with 12 decimals
--  positions, the result would contain Dividend = 63322, Divisor = 195,
--  Quotient = 324, Decimals = [7, 2, 8, 2, 0, 5, 1, 2], Cycle = 3 and
--  Remainder = :
--
--            63322  |_195__________
--             482     324.72820512
--              922          ▲
--              1420         │
--                550        │
--                1600 ◀─────┴──┐
--                  400         │
--                   1000       │
--                     250      │
--                      550     │
--                      160 ◀───┴─── cycle detected, no more decimals
--
--  NOTE: Previous remainders must be stored for cycle detection!

separate (Euler_Package)
function Detailed_Division
  (Dividend, Divisor : Int_Type; Decimals : Natural)
   return Detailed_Division_Type
is
   DDiv : Detailed_Division_Type;

   function Select_Sub_Dividend (DDiv : Detailed_Division) return Int_Type is
      Sub_Dividend : Int_Type := 0;
   begin
      loop
         Sub_Dividend := 0;
         exit when Sub_Dividend >= DDiv.Divisor;
      end loop;
      return 0;
   end Select_Sub_Dividend;

begin
   return DDiv;
end Detailed_Division;
