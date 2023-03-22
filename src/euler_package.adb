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

with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Numerics.Elementary_Functions;

use Ada.Strings;
use Ada.Strings.Fixed;
use Ada.Numerics.Elementary_Functions;

package body Euler_Package is

   ------------------
   -- All_Divisors --
   ------------------

   function All_Divisors (Number : Int_Type) return Set_Type is
      Divisors : Set_Type := Proper_Divisors (Number);
   begin
      Divisors.Include (Number);
      return Divisors;
   end All_Divisors;

   ------------------
   -- Are_Amicable --
   ------------------

   function Are_Amicable (A, B : Int_Type) return Boolean is
     (Sum (Proper_Divisors (A)) = B and then Sum (Proper_Divisors (B)) = A);

   ---------------
   -- CN_Assign --
   ---------------

   procedure CN_Assign (Left : in out Crumbled_Natural; Right : Int_Type) is
   begin
      Left := Numeral_Package.Empty_Vector;

      for X of To_String (Right) loop
         Left.Append (Numeral_Type (To_Number (X)));
      end loop;
   end CN_Assign;

   ---------------
   -- CN_Assign --
   ---------------

   procedure CN_Assign (Left : in out Int_Type; Right : Crumbled_Natural) is
   begin
      Left := 0;
      for X of Right loop
         Left := Left * 10 + Int_Type (X);
      end loop;
   end CN_Assign;

   ---------------
   -- CN_Assign --
   ---------------

   procedure CN_Assign
     (Left                   : in out Int_Type; Right : Crumbled_Natural;
      Digit_Start, Digit_End :        Positive)
   is
   begin
      Left := 0;
      for I in Digit_Start .. Digit_End loop
         Left := Left * 10 + Int_Type (Right.Element (I));
      end loop;
   end CN_Assign;

   ------------------
   -- Collatz_Next --
   ------------------

   function Collatz_Next (Number : Int_Type) return Int_Type is
      Next : Int_Type := Number;
   begin
      if Number mod 2 = 0 then
         Next := @ / 2;
      else
         Next := @ * 3 + 1;
      end if;
      return Next;
   end Collatz_Next;

   -----------------
   -- Combination --
   -----------------

   function Combination (N, K : Int_Type) return Int_Type is
      Result : Int_Type := 1;
   begin
      if K = 0 or else K = N then
         Result := 1;
      else
         for I in reverse N - K + 1 .. N loop
            Result := @ * I;
         end loop;
         Result := @ / Factorial (K);
      end if;
      return Result;
   end Combination;

   ------------
   -- Concat --
   ------------

   function Concat (Left, Right : Int_Type) return Int_Type is
     (To_Number (Trim (Left'Image, Both) & Trim (Right'Image, Both)));

   ----------------------
   -- Decimal_Division --
   ----------------------

   function Decimal_Division
     (Dividend, Divisor : Int_Type; Decimals : Natural)
      return Decimal_Division_Type is separate;

   -------------------------------
   -- Decimal_Division_Increase --
   -------------------------------

   procedure Decimal_Division_Increase
     (DDiv : in out Decimal_Division_Type; Decimals : Natural) is separate;

   -------------------
   -- Element_First --
   -------------------

   function Element_First (Set : Set_Type) return Int_Type is
      Element : Int_Type := 0;
   begin
      if not Set.Is_Empty then
         Element := Set.First_Element;
      end if;
      return Element;
   end Element_First;

   -----------------
   -- Element_Nth --
   -----------------

   function Element_Nth (Set : Set_Type; Nth : Natural) return Int_Type is
      Element : Int_Type := 0;
      Index   : Natural  := 0;
   begin
      if not Set.Is_Empty and then Nth <= Natural (Set.Length) then
         for Elt of Set loop
            Index := Index + 1;
            if Index = Nth then
               Element := Elt;
               exit;
            end if;
         end loop;
      end if;
      return Element;
   end Element_Nth;

   ------------
   -- Equals --
   ------------

   function Equals (List : List_Type) return Boolean is
      First : constant Int_Type := List.First_Element;
      Equal : Boolean           := True;
   begin
      for Element of List loop
         Equal := @ and then (Element = First);
         exit when not Equal;
      end loop;
      return Equal;
   end Equals;

   ---------------
   -- Factorial --
   ---------------

   function Factorial (Number : Int_Type) return Int_Type is
      Result : Int_Type := 1;
   begin
      if Number >= 2 then
         for N in 2 .. Number loop
            Result := @ * N;
         end loop;
      end if;
      return Result;
   end Factorial;

   ---------------------
   -- Fibonacci_Start --
   ---------------------

   type Fibonacci_Type is record
      Term_2 : Int_Type;
      Term_1 : Int_Type;

   end record;

   Fibonacci_Cursor : Fibonacci_Type;

   function Fibonacci_Start return Int_Type is
   begin
      Fibonacci_Cursor.Term_2 := 1;
      Fibonacci_Cursor.Term_1 := 1;
      return Fibonacci_Next;
   end Fibonacci_Start;

   ---------------------
   -- Fibonacci_Start --
   ---------------------

   function Fibonacci_Start (A, B : Int_Type) return Int_Type is
   begin
      Fibonacci_Cursor.Term_2 := A;
      Fibonacci_Cursor.Term_1 := B;
      return Fibonacci_Next;
   end Fibonacci_Start;

   --------------------
   -- Fibonacci_Next --
   --------------------

   function Fibonacci_Next return Int_Type is
      Term_N : Int_Type;
   begin
      Term_N := Fibonacci_Cursor.Term_2 + Fibonacci_Cursor.Term_1;
      Fibonacci_Cursor.Term_2 := Fibonacci_Cursor.Term_1;
      Fibonacci_Cursor.Term_1 := Term_N;
      return Term_N;
   end Fibonacci_Next;

   --------------
   -- Hundreds --
   --------------

   function Hundreds (Number : Int_Type) return Int_Type is
     (Number / 100 mod 10);

   -----------------
   -- Is_Abundant --
   -----------------

   function Is_Abundant (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) > Number);

   ------------------
   -- Is_Deficient --
   ------------------

   function Is_Deficient (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) < Number);

   ----------------
   -- Is_Divisor --
   ----------------

   function Is_Divisor (Number, Divisor : Int_Type) return Boolean is
     (Number mod Divisor = 0);

   -------------
   -- Is_Even --
   -------------

   function Is_Even (Number : Int_Type) return Boolean is (Number mod 2 = 0);

   ------------
   -- Is_Odd --
   ------------

   function Is_Odd (Number : Int_Type) return Boolean is (Number mod 2 = 1);

   -------------------
   -- Is_Palindrome --
   -------------------

   function Is_Palindrome (Number : Int_Type) return Boolean is
      Text : constant String := Trim (Number'Image, Both);
      I    : Natural         := Text'First;
      J    : Natural         := Text'Last;
   begin
      loop
         if Text (I) /= Text (J) then
            return False;
         end if;
         exit when I > Text'Length / 2;
         I := I + 1;
         J := J - 1;
      end loop;
      return True;
   end Is_Palindrome;

   ----------------
   -- Is_Perfect --
   ----------------

   function Is_Perfect (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) = Number);

   --------------
   -- Is_Prime --
   --------------

   function Is_Prime (Number : Int_Type) return Boolean is
   begin
      if Number <= 11 then
         declare
            First_Primes : constant array (1 .. 11) of Boolean :=
              [False, True, True, False, True, False, True, False, False,
              False, True];
         begin
            return First_Primes (Natural (Number));
         end;
      else
         declare
            Root   : constant Int_Type := Square_Root (Number);
            Factor : Int_Type          := 2;
            Inc    : Natural           := 3;
         begin
            loop
               if Number mod Factor = 0 then
                  return False;
               end if;
               exit when Factor >= Root;
               if Factor <= 10 then
                  Factor := @ + 1;
               else
                  if Inc = 4 then
                     Factor := @ + 4;
                     Inc    := 1;
                  else
                     Factor := @ + 2;
                     Inc    := @ + 1;
                  end if;
               end if;
            end loop;
         end;
      end if;
      return True;
   end Is_Prime;

   ----------
   -- Left --
   ----------

   function Left (Number : Int_Type; Positions : Positive) return Int_Type is
      Text    : constant String  := To_String (Number);
      Pos_End : constant Natural := Natural'Min (Positions, Text'Length);
   begin
      return To_Number (Text (1 .. Pos_End));
   end Left;

   ------------
   -- Length --
   ------------

   function Length (Number : Crumbled_Natural) return Natural is
     (Natural (Number.Length));

   ------------
   -- Length --
   ------------

   function Length (Number : Int_Type) return Natural is
     (Natural (To_String (Number)'Length));

   ------------
   -- Length --
   ------------

   function Length (List : List_Type) return Natural is
     (Natural (List.Length));

   ------------
   -- Length --
   ------------

   function Length (Set : Set_Type) return Natural is (Natural (Set.Length));

   ---------------------------------------------------------------------
   -- PRIME NUMBERS MANAGEMENT - Private types, objects and functions --
   ---------------------------------------------------------------------

   procedure Prime_Next_Try (Cursor : in out Prime_Cursor_Type) is
   begin
      Cursor.Δ_Number := @ + 1;
      if Cursor.Δ_Number = 0 then
         Cursor.Number := @ + 4;
      else
         Cursor.Number := @ + 2;
      end if;
   end Prime_Next_Try;
   pragma Inline_Always (Prime_Next_Try);

   function Prime_Next_Internal
     (Cursor : in out Prime_Cursor_Type) return Int_Type
   is
   begin
      if Cursor.Number < 10 then
         case Cursor.Number is
            when 2 =>
               Cursor.Number := 3;
            when 3 =>
               Cursor.Number := 5;
            when 5 =>
               Cursor.Number := 7;
            when 7 =>
               Cursor.Number := 11;
            when others =>
               null;
         end case;
      else
         declare
            Factor      : Int_Type;
            Square_Root : Int_Type;
            Is_Prime    : Boolean;
         begin
            Test_Nex_Prime :
            loop
               Prime_Next_Try (Cursor);
               Factor      := 3;
               Square_Root :=
                 Int_Type (Float'Ceiling (Sqrt (Float (Cursor.Number))));
               Is_Prime    := True;
               Test_Prime :
               loop
                  if Cursor.Number mod Factor = 0 then
                     Is_Prime := False;
                     exit Test_Prime;
                  end if;
                  exit Test_Prime when Factor >= Square_Root;
                  Factor := @ + 2;
               end loop Test_Prime;
               exit Test_Nex_Prime when Is_Prime;
            end loop Test_Nex_Prime;
         end;
      end if;
      return Cursor.Number;
   end Prime_Next_Internal;

   function Prime_Next_Internal
     (Cursor : in out Prime_Cursor_Type; Nth : Int_Type) return Int_Type
   is
      Prime : Int_Type;
   begin
      for I in 2 .. Nth loop
         Prime := Prime_Next_Internal (Cursor);
      end loop;
      return Prime;
   end Prime_Next_Internal;

   -------------------
   -- Prime_Factors --
   -------------------

   function Prime_Factors (Number : Int_Type) return List_Type is
      Cursor   : Prime_Cursor_Type;
      List     : List_Type := Empty_List;
      Dividend : Int_Type  := Number;
      Prime    : Int_Type  := Prime_First (Cursor);
   begin
      loop
         if Is_Divisor (Dividend, Prime) then
            List.Append (Prime);
            Dividend := @ / Prime;
         else
            Prime := Prime_Next_Internal (Cursor);
         end if;
         exit when Prime > Dividend;
      end loop;
      return List;
   end Prime_Factors;

   -----------------
   -- Prime_First --
   -----------------

   function Prime_First (Cursor : in out Prime_Cursor_Type) return Int_Type is
   begin
      Cursor.Number   := 2;
      Cursor.Δ_Number := 2;
      return Cursor.Number;
   end Prime_First;

   ----------------
   -- Prime_Next --
   ----------------

   function Prime_Next
     (Cursor : in out Prime_Cursor_Type; Nth : Int_Type := 1) return Int_Type
   is
   begin
      if Nth = 1 then
         return Prime_Next_Internal (Cursor);
      else
         return Prime_Next_Internal (Cursor, Nth + 1);
      end if;
   end Prime_Next;

   ---------------
   -- Prime_Nth --
   ---------------

   function Prime_Nth (Nth : Int_Type) return Int_Type is
      Cursor : Prime_Cursor_Type;
   begin
      if Nth = 1 then
         return Cursor.Number;
      else
         return Prime_Next_Internal (Cursor, Nth);
      end if;
   end Prime_Nth;

   -------------
   -- Product --
   -------------

   function Product (List : List_Type) return Int_Type is
      Result : Int_Type := 1;
   begin
      for Number of List loop
         Result := @ * Number;
      end loop;
      return Result;
   end Product;

   ---------------------
   -- Proper_Divisors --
   ---------------------

   function Proper_Divisors (Number : Int_Type) return Set_Type is
      Root     : Int_Type;
      Divisors : Set_Type := Set_Package.Empty_Set;
   begin
      if Number > 1 then
         Divisors.Insert (1);
      end if;
      if Number > 3 then
         Root := Square_Root (Number);
         for Factor in 2 .. Root loop
            if Number mod Factor = 0 then
               Divisors.Insert (Factor);
               Divisors.Include (Number / Factor);
            end if;
         end loop;
      end if;
      return Divisors;
   end Proper_Divisors;

   ----------
   -- Right --
   ----------

   function Right (Number : Int_Type; Positions : Positive) return Int_Type is
      Text      : constant String  := To_String (Number);
      Minimum   : constant Natural := Natural'Min (Positions, Text'Length);
      Pos_Start : constant Natural := Natural (Text'Length) + 1 - Minimum;
   begin
      return To_Number (Text (Pos_Start .. Text'Length));
   end Right;

   ----------
   -- Sort --
   ----------

   procedure Sort (List : in out List_Type) is
      package Sort_Package is new List_Package.Generic_Sorting;
   begin
      Sort_Package.Sort (List);
   end Sort;

   -----------------
   -- Square_Root --
   -----------------

   function Square_Root (Number : Int_Type) return Int_Type is
      Result : Int_Type := 0;
   begin
      if Number > 0 then
         Result := Int_Type (Float'Floor (Sqrt (Float (Number))));
      end if;
      return Result;
   end Square_Root;

   ----------------
   -- Sub_Number --
   ----------------

   function Sub_Number
     (Number : Int_Type; Start, Length : Positive) return Int_Type
   is
      Text      : constant String  := To_String (Number);
      Pos_Start : constant Natural := Natural'Min (Start, Text'Length);
      Pos_End   : constant Natural :=
        Natural'Min (Start + Length - 1, Text'Length);

      Result : Int_Type := 0;
   begin
      if Start <= Text'Length then
         Result := To_Number (Text (Pos_Start .. Pos_End));
      end if;
      return Result;
   end Sub_Number;

   ---------
   -- Sum --
   ---------

   function Sum (List : List_Type) return Int_Type is
      Result : Int_Type := 0;
   begin
      for Number of List loop
         Result := @ + Number;
      end loop;
      return Result;
   end Sum;

   ---------
   -- Sum --
   ---------

   function Sum (Set : Set_Type) return Int_Type is
      Sum : Int_Type := 0;
   begin
      for Number of Set loop
         Sum := @ + Number;
      end loop;
      return Sum;
   end Sum;

   -------------------
   -- Sum_Multiples --
   -------------------

   function Sum_Multiples
     (Number : Int_Type; Upper_Bound : Int_Type) return Int_Type
   is
      Num_Multiples : constant Int_Type := Upper_Bound / Number;
   begin
      return Number * ((Num_Multiples * Num_Multiples + Num_Multiples) / 2);
   end Sum_Multiples;

   ------------------
   -- Sum_Sequence --
   ------------------

   function Sum_Sequence (Number : Int_Type) return Int_Type is
     ((Number * (Number + 1)) / 2);

   -----------------
   -- Sum_Squares --
   -----------------

   function Sum_Squares (Number : Int_Type) return Int_Type is
     ((Number * (Number + 1) * (2 * Number + 1)) / 6);

   ----------
   -- Tens --
   ----------

   function Tens (Number : Int_Type) return Int_Type is (Number / 10 mod 10);

   ---------------
   -- Thousands --
   ---------------

   function Thousands (Number : Int_Type) return Int_Type is
     (Number / 1_000 mod 10);

   ---------------
   -- To_Number --
   ---------------

   function To_Number (Chr : Character) return Int_Type is
      Result : Int_Type := 0;
   begin
      if Chr in '0' .. '9' then
         Result := Character'Enum_Rep (Chr) - Character'Enum_Rep ('0');
      end if;
      return Result;
   end To_Number;

   ---------------
   -- To_Number --
   ---------------

   function To_Number (Str : String) return Int_Type is
      package T_IO is new Ada.Text_IO.Integer_IO (Int_Type);
      Result : Int_Type;
      Last   : Positive;
   begin
      T_IO.Get (Str, Result, Last);
      if Last /= Str'Last then
         Result := 0;
      end if;
      return Result;
   end To_Number;

   ---------------
   -- To_String --
   ---------------

   function To_String (Number : Int_Type) return String is
     (Trim (Number'Image, Both));

   -----------
   -- Units --
   -----------

   function Units (Number : Int_Type) return Int_Type is (Number mod 10);

end Euler_Package;
