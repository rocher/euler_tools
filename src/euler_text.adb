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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Euler_Tools;

package body Euler_Text is

   function Tus (Source : String) return Unbounded_String renames
     To_Unbounded_String;

   Name_Units : constant array (0 .. 9) of Unbounded_String :=
     [Tus ("zero"), Tus ("one"), Tus ("two"), Tus ("three"), Tus ("four"),
     Tus ("five"), Tus ("six"), Tus ("seven"), Tus ("eight"), Tus ("nine")];

   Name_Ten_Something : constant array (10 .. 19) of Unbounded_String :=
     [Tus ("ten"), Tus ("eleven"), Tus ("twelve"), Tus ("thirteen"),
     Tus ("fourteen"), Tus ("fifteen"), Tus ("sixteen"), Tus ("seventeen"),
     Tus ("eighteen"), Tus ("nineteen")];

   Name_Tens : constant array (2 .. 9) of Unbounded_String :=
     [Tus ("twenty"), Tus ("thirty"), Tus ("forty"), Tus ("fifty"),
     Tus ("sixty"), Tus ("seventy"), Tus ("eighty"), Tus ("ninety")];

   ---------------------------
   -- Tenths_And_Units_Text --
   ---------------------------

   function Tenths_And_Units_Text (Number : Natural) return Unbounded_String is
   begin
      if Number <= 9 then
         return Name_Units (Number);
      elsif Number <= 19 then
         return Name_Ten_Something (Number);
      else
         declare
            Units : constant Natural := Euler_Tools.Units (Number);
            Tens  : constant Natural := Euler_Tools.Tens (Number);
            Text  : Unbounded_String := Name_Tens (Tens);
         begin
            if Units > 0 then
               Text := @ & Tus ("-") & Name_Units (Units);
            end if;
            return Text;
         end;
      end if;
   end Tenths_And_Units_Text;

   -------------------
   -- Hundreds_Text --
   -------------------

   function Hundreds_Text (Number : Natural) return Unbounded_String is
      Text : Unbounded_String := Tus ("");
   begin
      if Number in 1 .. 9 then
         Text := Name_Units (Number) & " hundred";
      end if;
      return Text;
   end Hundreds_Text;

   --------------
   -- To_Words --
   --------------

   function To_Words (Number : Natural) return String is
      Text      : Unbounded_String := Tus ("");
      Units     : constant Natural := Euler_Tools.Units (Number);
      Tens      : constant Natural := Euler_Tools.Tens (Number);
      Hundreds  : constant Natural := Euler_Tools.Hundreds (Number);
      Thousands : constant Natural := Euler_Tools.Thousands (Number);
   begin

      if Thousands > 0 then
         Text := Name_Units (Thousands);
         Text.Append (" thousand");
      end if;

      if Text.Length > 0 then
         Text.Append (" ");
         Text.Append (Hundreds_Text (Hundreds));
      else
         Text := Hundreds_Text (Hundreds);
      end if;

      if Tens + Units > 0 then
         if Text.Length > 0 then
            Text.Append (" and ");
            Text.Append (Tenths_And_Units_Text (Tens * 10 + Units));
         else
            Text := Tenths_And_Units_Text (Tens * 10 + Units);
         end if;
      else
         if Text.Length = 0 then
            Text := Name_Units (0);
         end if;
      end if;

      return To_String (Text);

   end To_Words;

end Euler_Text;
