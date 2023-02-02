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

with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Numerics.Elementary_Functions;

use Ada.Strings;
use Ada.Strings.Fixed;
use Ada.Numerics.Elementary_Functions;

package body Euler_Package is

   --------------------
   --  All_Divisors  --
   --------------------

   function All_Divisors (Number : Int_Type) return Set_Type is
      Divisors : Set_Type := Proper_Divisors (Number);
   begin
      Divisors.Include (Number);
      return Divisors;
   end All_Divisors;

   --------------------
   --  Are_Amicable  --
   --------------------

   function Are_Amicable (A, B : Int_Type) return Boolean is
     (Sum (Proper_Divisors (A)) = B and then Sum (Proper_Divisors (B)) = A);

   -----------------
   --  CN_Assign  --
   -----------------

   procedure CN_Assign (Left : in out Crumbled_Natural; Right : Int_Type) is
   begin
      Left := Vector_Package.Empty_Vector;

      for X of To_String (Right) loop
         Left.Append (Numeral_Type (To_Number (X)));
      end loop;
   end CN_Assign;

   -----------------
   --  CN_Assign  --
   -----------------

   procedure CN_Assign (Left : in out Int_Type; Right : Crumbled_Natural) is
      Power : Positive := 1;
   begin
      Left := 0;

      for X of Right loop
         Left := Left * 10**Power + Int_Type (X);
      end loop;
   end CN_Assign;

   -----------------
   --  CN_Assign  --
   -----------------

   procedure CN_Assign
     (Left                   : in out Int_Type; Right : Crumbled_Natural;
      Digit_start, Digit_End :        Positive)
   is
      Power : Positive := 1;
   begin
      Left := 0;

      for I in Digit_start .. Digit_End loop
         Left := Left * 10**Power + Int_Type (Right.Element (I));
      end loop;
   end CN_Assign;

   ---------------------
   --  Collatz_First  --
   ---------------------

   Collatz_Number : Int_Type;

   function Collatz_First (Number : Int_Type) return Int_Type is
   begin
      Collatz_Number := Number;
      return Collatz_Number;
   end Collatz_First;

   --------------------
   --  Collatz_Next  --
   --------------------

   function Collatz_Next return Int_Type is
   begin
      if Collatz_Number mod 2 = 0 then
         Collatz_Number := @ / 2;
      else
         Collatz_Number := @ * 3 + 1;
      end if;
      return Collatz_Number;
   end Collatz_Next;

   -------------------
   --  Combination  --
   -------------------

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

   --------------
   --  Concat  --
   --------------

   function Concat (Left, Right : Int_Type) return Int_Type is
     (To_Number (Trim (Left'Image, Both) & Trim (Right'Image, Both)));

   ---------------------
   --  Element_First  --
   ---------------------

   function Element_First (Set : Set_Type) return Int_Type is
      Element : Int_Type := 0;
   begin
      if not Set.Is_Empty then
         Element := Set.First_Element;
      end if;
      return Element;
   end Element_First;

   -------------------
   --  Element_Nth  --
   -------------------

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

   -----------------
   --  Factorial  --
   -----------------

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

   -----------------------
   --  Fibonacci_Start  --
   -----------------------

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

   -----------------------
   --  Fibonacci_Start  --
   -----------------------

   function Fibonacci_Start (A, B : Int_Type) return Int_Type is
   begin
      Fibonacci_Cursor.Term_2 := A;
      Fibonacci_Cursor.Term_1 := B;
      return Fibonacci_Next;
   end Fibonacci_Start;

   ----------------------
   --  Fibonacci_Next  --
   ----------------------

   function Fibonacci_Next return Int_Type is
      Term_N : Int_Type;
   begin
      Term_N := Fibonacci_Cursor.Term_2 + Fibonacci_Cursor.Term_1;
      Fibonacci_Cursor.Term_2 := Fibonacci_Cursor.Term_1;
      Fibonacci_Cursor.Term_1 := Term_N;
      return Term_N;
   end Fibonacci_Next;

   ----------------
   --  Hundreds  --
   ----------------

   function Hundreds (Number : Int_Type) return Int_Type is
     (Number / 100 mod 10);

   -------------------
   --  Is_Abundant  --
   -------------------

   function Is_Abundant (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) > Number);

   --------------------
   --  Is_Deficient  --
   --------------------

   function Is_Deficient (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) < Number);

   ------------------
   --  Is_Divisor  --
   ------------------

   function Is_Divisor (Number, Divisor : Int_Type) return Boolean is
     (Number mod Divisor = 0);

   ---------------
   --  Is_Even  --
   ---------------

   function Is_Even (Number : Int_Type) return Boolean is (Number mod 2 = 0);

   --------------
   --  Is_Odd  --
   --------------

   function Is_Odd (Number : Int_Type) return Boolean is (Number mod 2 = 1);

   ---------------------
   --  Is_Palindrome  --
   ---------------------

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

   ------------------
   --  Is_Perfect  --
   ------------------

   function Is_Perfect (Number : Int_Type) return Boolean is
     (Sum (Proper_Divisors (Number)) = Number);

   ----------------
   --  Is_Prime  --
   ----------------

   function Is_Prime (Number : Int_Type) return Boolean is
   begin
      if Number <= 11 then
         declare
            First_Primes : constant array (2 .. 11) of Boolean :=
              [True, True, False, True, False, True, False, False, False,
              True];
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

   -------------------
   --  Prime_First  --
   -------------------

   type Prime_Cursor_Type is record
      Number : Int_Type := 0;
      Inc    : Int_Type := 0;
   end record;
   type Prime_Cursor_Access is access Prime_Cursor_Type;

   Prime_Private_Cursor : constant Prime_Cursor_Access :=
     new Prime_Cursor_Type;
   Prime_Public_Cursor : constant Prime_Cursor_Access := new Prime_Cursor_Type;

   procedure Prime_Next_Try (PC : Prime_Cursor_Access) is
   begin
      if PC.Inc = 4 then
         PC.Number := @ + 4;
         PC.Inc    := 1;
      else
         PC.Number := @ + 2;
         PC.Inc    := @ + 1;
      end if;
   end Prime_Next_Try;

   function Prime_First_Internal (PC : Prime_Cursor_Access) return Int_Type is
   begin
      PC.Number := 2;
      PC.Inc    := 3;
      return PC.Number;
   end Prime_First_Internal;

   function Prime_First return Int_Type is
     (Prime_First_Internal (Prime_Public_Cursor));

   function Prime_Next_Internal (PC : Prime_Cursor_Access) return Int_Type is
   begin
      if PC.Number < 10 then
         case PC.Number is
            when 2 =>
               PC.Number := 3;
            when 3 =>
               PC.Number := 5;
            when 5 =>
               PC.Number := 7;
            when 7 =>
               PC.Number := 11;
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
               Prime_Next_Try (PC);
               Factor      := 3;
               Square_Root :=
                 Int_Type (Float'Ceiling (Sqrt (Float (PC.Number))));
               Is_Prime    := True;
               Test_Prime :
               loop
                  if PC.Number mod Factor = 0 then
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
      return PC.Number;
   end Prime_Next_Internal;

   ------------------
   --  Prime_Next  --
   ------------------

   function Prime_Next return Int_Type is
     (Prime_Next_Internal (Prime_Public_Cursor));

   -----------------
   --  Prime_Nth  --
   -----------------

   function Prime_Nth_Internal
     (N : Int_Type; PC : Prime_Cursor_Access) return Int_Type
   is
      Prime : Int_Type := Prime_First_Internal (PC);
   begin
      for I in 2 .. N loop
         Prime := Prime_Next_Internal (PC);
      end loop;
      return Prime;
   end Prime_Nth_Internal;

   function Prime_Nth (Nth : Int_Type) return Int_Type is
     (Prime_Nth_Internal (Nth, Prime_Private_Cursor));

   -----------------------
   --  Proper_Divisors  --
   -----------------------

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

   -------------------
   --  Square_Root  --
   -------------------

   function Square_Root (Number : Int_Type) return Int_Type is
      Result : Int_Type := 0;
   begin
      if Number > 0 then
         Result := Int_Type (Float'Floor (Sqrt (Float (Number))));
      end if;
      return Result;
   end Square_Root;

   -----------
   --  Sum  --
   -----------

   function Sum (Set : Set_Type) return Int_Type is
      Sum : Int_Type := 0;
   begin
      for Number of Set loop
         Sum := @ + Number;
      end loop;
      return Sum;
   end Sum;

   ---------------------
   --  Sum_Multiples  --
   ---------------------

   function Sum_Multiples
     (Number : Int_Type; Upper_Bound : Int_Type) return Int_Type
   is
      Num_Multiples : constant Int_Type := (Upper_Bound - 1) / Number;
   begin
      return Number * ((Num_Multiples * Num_Multiples + Num_Multiples) / 2);
   end Sum_Multiples;

   --------------------
   --  Sum_Sequence  --
   --------------------

   function Sum_Sequence (Number : Int_Type) return Int_Type is
     ((Number * (Number + 1)) / 2);

   -------------------
   --  Sum_Squares  --
   -------------------

   function Sum_Squares (Number : Int_Type) return Int_Type is
     ((Number * (Number + 1) * (2 * Number + 1)) / 6);

   ------------
   --  Tens  --
   ------------

   function Tens (Number : Int_Type) return Int_Type is (Number / 10 mod 10);

   -----------------
   --  Thousands  --
   -----------------

   function Thousands (Number : Int_Type) return Int_Type is
     (Number / 1_000 mod 10);

   -----------------
   --  To_Number  --
   -----------------

   function To_Number (Chr : Character) return Int_Type is
      Result : Int_Type := 0;
   begin
      if Chr in '0' .. '9' then
         Result := Character'Enum_Rep (Chr) - Character'Enum_Rep ('0');
      end if;
      return Result;
   end To_Number;

   -----------------
   --  To_Number  --
   -----------------

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

   -----------------
   --  To_String  --
   -----------------

   function To_String (Number : Int_Type) return String is
     (Trim (Number'Image, Both));

   -------------
   --  Units  --
   -------------

   function Units (Number : Int_Type) return Int_Type is (Number mod 10);

end Euler_Package;
