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
--  For example, 63322/195 = 324.72(820512). Calling Decimal_Division with
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
--  For the operation Decimal_Division (63322, 195, 12), with 12 decimals
--  positions, the result would contain Dividend = 63322, Divisor = 195,
--  Quotient = 324, Decimals = [7, 2, 8, 2, 0, 5, 1, 2], Cycle = 3 and
--  Remainders = [48, 92, 142, 55, 160, 40, 100, 25, 55, 160]:
--
--            63322  |_195_________
--             482     324.7282051
--              922         ▲    ▲
--              1420        ├────┘
--                550 ◀─────┴───┐
--                1600          │
--                  400         │
--                   1000       │
--                     250      │
--                      550 ◀───┴─── cycle detected, no more decimals
--
--  NOTE: Previous remainders must be stored for cycle detection!

separate (Euler_Package)
function Decimal_Division
  (Dividend, Divisor : Int_Type; Decimals : Natural)
   return Decimal_Division_Type
is
   DDiv         : Decimal_Division_Type;
   Tmp_Decimal  : Int_Type;
   Tmp_Dividend : Int_Type;
   Tmp_Reminder : Int_Type;

   --  NOTE: For a really detailed (graphical?) implementation
   --  function Select_Sub_Dividend
   --    (DDiv : in out Decimal_Division_Type) return Int_Type
   --  is
   --     Sub_Dividend : Int_Type;
   --  begin
   --     if DDiv.Remainders.Is_Empty then
   --        Sub_Dividend := 0;
   --     else
   --        Sub_Dividend := DDiv.Remainders.Last_Element;
   --     end if;

   --     if DDiv.Index < Length (DDiv.Dividend) then
   --        loop
   --           DDiv.Index   := @ + 1;
   --           Sub_Dividend :=
   --             Concat (Sub_Dividend, Sub_Number (DDiv.Divisor, DDiv.Index, 1));
   --           exit when Sub_Dividend >= DDiv.Divisor
   --             or else DDiv.Index = Length (DDiv.Divisor);
   --        end loop;
   --     end if;

   --     return Sub_Dividend;
   --  end Select_Sub_Dividend;

begin
   DDiv.Dividend   := Dividend;
   DDiv.Divisor    := Divisor;
   DDiv.Quotient   := 0;
   DDiv.Decimals   := CN_Empty;
   DDiv.Cycle      := 0;
   DDiv.Remainders := Empty_List;

   --  Integer division
   DDiv.Quotient := DDiv.Dividend / DDiv.Divisor;
   DDiv.Remainders.Append (DDiv.Dividend rem DDiv.Divisor);

   --  NOTE: For a decimal implementation
   --  if DDiv.Dividend >= DDiv.Divisor then
   --     loop
   --        Sub_Dividend := Select_Sub_Dividend (DDiv);
   --        exit when Sub_Dividend < DDiv.Divisor;

   --        Sub_Quotient := Sub_Dividend / DDiv.Divisor;
   --        DDiv.Remainders.Append (Sub_Dividend - Sub_Quotient * DDiv.Divisor);
   --     end loop;
   --  end if;

   --  Decimal division
   if DDiv.Remainders.Last_Element > 0 then
      loop
         Tmp_Dividend := DDiv.Remainders.Last_Element;
         Tmp_Dividend := Concat (Tmp_Dividend, 0);

         Tmp_Decimal  := Tmp_Dividend / DDiv.Divisor;
         Tmp_Reminder := Tmp_Dividend rem DDiv.Divisor;

         exit when Length (DDiv.Decimals) = Decimals or else Tmp_Dividend = 0;

         --  cycle detection
         declare
            use List_Package;

            Index      : Natural             := Length (DDiv.Decimals);
            Rem_Cursor : List_Package.Cursor := DDiv.Remainders.Last;
         begin
            loop
               exit when not Has_Element (Rem_Cursor);

               if Rem_Cursor.Element = Tmp_Reminder then
                  DDiv.Cycle := Index + 1;
               end if;

               exit when DDiv.Cycle > 0 or else Index = 0;

               Index      := @ - 1;
               Rem_Cursor := Rem_Cursor.Previous;
            end loop;
         end;

         DDiv.Decimals.Append (Numeral_Type (Tmp_Decimal));
         DDiv.Remainders.Append (Tmp_Reminder);

         exit when DDiv.Cycle > 0;
      end loop;
   end if;

   return DDiv;
end Decimal_Division;
