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

separate (Euler_Package)
procedure Decimal_Division_Increase
  (DDiv : in out Decimal_Division_Type; Decimals : Natural)
is
   Tmp_Decimal  : Int_Type;
   Tmp_Dividend : Int_Type;
   Tmp_Reminder : Int_Type;
begin
   if DDiv.Remainders.Last_Element > 0 and then DDiv.Cycle = 0 then
      loop
         Tmp_Dividend := DDiv.Remainders.Last_Element;
         Tmp_Dividend := Concat (Tmp_Dividend, 0);

         Tmp_Decimal  := Tmp_Dividend / DDiv.Divisor;
         Tmp_Reminder := Tmp_Dividend rem DDiv.Divisor;

         exit when Length (DDiv.Decimals) = Decimals or else Tmp_Dividend = 0;

         --  cycle detection
         declare
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
end Decimal_Division_Increase;
