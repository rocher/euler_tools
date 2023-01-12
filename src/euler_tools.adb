with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

package body Euler_Tools is

   Collatz_Number : T;

   function Collatz_First (Number : T) return T is
   begin
      Collatz_Number := Number;
      return Collatz_Number;
   end Collatz_First;

   function Collatz_Next return T is
   begin
      if Collatz_Number mod 2 = 0 then
         Collatz_Number := @ / 2;
      else
         Collatz_Number := @ * 3 + 1;
      end if;
      return Collatz_Number;
   end Collatz_Next;

   function Combination (N, K : T) return T is
      Result : T := 0;
   begin
      if 0 <= K and then K <= N then
         if K = 0 or else K = N then
            Result := 1;
         else
            Result := 1;
            for I in reverse N - K + 1 .. N loop
               Result := @ * I;
            end loop;
            Result := @ / Factorial (K);
         end if;
      end if;
      return Result;
   end Combination;

   function Concat (Left, Right : T) return T is
      SLeft  : String := Left'Image;
      SRight : String := Right'Image;
      Result : T      := 0;
   begin
      if Right >= 0 then
         if SLeft (SLeft'First) = ' ' then
            SLeft := SLeft (SLeft'First + 1 .. SLeft'Last);
         else
            SLeft := SLeft (SLeft'First .. SLeft'Last);
         end if;
         SRight := SRight (SRight'First + 1 .. SRight'Last);
         Result := To_Number (SLeft & SRight);
      end if;
      return Result;
   end Concat;

   function Is_Palindrome (Number : T) return Boolean is
      Img : constant String := Number'Image;
      Str : constant String := Img (2 .. Img'Length);
      I   : Natural         := Str'First;
      J   : Natural         := Str'Last;
   begin
      loop
         if Str (I) /= Str (J) then
            return False;
         end if;
         exit when I > Str'Length / 2;
         I := I + 1;
         J := J - 1;
      end loop;
      return True;
   end Is_Palindrome;

   function Factorial (Number : T) return T is
      Result : T := 1;
      N      : T := 1;
   begin
      if Number > 1 then
         loop
            exit when N = Number;
            N      := @ + 1;
            Result := @ * N;
         end loop;
      end if;
      return Result;
   end Factorial;

   function Factors (Number : T) return List_Type is
      use Ada.Numerics.Elementary_Functions;
      package Sorting is new List_Package.Generic_Sorting;
      Square_Root : constant T := T (Float'Floor (Sqrt (Float (Number))));
      Factor_List : List_Type;
   begin
      Factor_List.Append (1);
      for Factor in 2 .. Square_Root loop
         if Number mod Factor = 0 then
            Factor_List.Append (Factor);
            Factor_List.Append (Number / Factor);
         end if;
      end loop;
      Factor_List.Append (Number);
      Sorting.Sort (Factor_List);
      return Factor_List;
   end Factors;

   function Is_Prime (Number : T) return Boolean is
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
            use Ada.Numerics.Elementary_Functions;
            Square_Root : constant T :=
              T (Float'Ceiling (Sqrt (Float (Number))));

            Factor : T       := 2;
            Inc    : Natural := 3;
         begin
            loop
               if Number mod Factor = 0 then
                  return False;
               end if;
               exit when Factor >= Square_Root;
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

   type Prime_Cursor_Type is record
      Number : T := 0;
      Inc    : T := 0;
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

   function Prime_First_Internal (PC : Prime_Cursor_Access) return T is
   begin
      PC.Number := 2;
      PC.Inc    := 3;
      return PC.Number;
   end Prime_First_Internal;

   function Prime_First return T is
     (Prime_First_Internal (Prime_Public_Cursor));

   function Prime_Next_Internal (PC : Prime_Cursor_Access) return T is
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
            use Ada.Numerics.Elementary_Functions;
            Factor      : T;
            Square_Root : T;
            Is_Prime    : Boolean;
         begin
            Test_Nex_Prime :
            loop
               Prime_Next_Try (PC);
               Factor      := 3;
               Square_Root := T (Float'Ceiling (Sqrt (Float (PC.Number))));
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

   function Prime_Next return T is (Prime_Next_Internal (Prime_Public_Cursor));

   function Prime_Nth_Internal (N : T; PC : Prime_Cursor_Access) return T is
      Prime : T := Prime_First_Internal (PC);
   begin
      for I in 2 .. N loop
         Prime := Prime_Next_Internal (PC);
      end loop;
      return Prime;
   end Prime_Nth_Internal;

   function Prime_Nth (N : T) return T is
     (Prime_Nth_Internal (N, Prime_Private_Cursor));

   function Sum_Multiples (N : T; Upper_Bound : T) return T is
      Num_Multiples : constant T := (Upper_Bound - 1) / N;
   begin
      return N * ((Num_Multiples * Num_Multiples + Num_Multiples) / 2);
   end Sum_Multiples;

   function Sum_Sequence (Upper_Bound : T) return T is
     ((Upper_Bound * (Upper_Bound + 1)) / 2);

   function Sum_Squares (Upper_Bound : T) return T is
     ((Upper_Bound * (Upper_Bound + 1) * (2 * Upper_Bound + 1)) / 6);

   function To_Number (Chr : Character) return T is
      Result : T := 0;
   begin
      if Chr in '0' .. '9' then
         Result := Character'Enum_Rep (Chr) - Character'Enum_Rep ('0');
      end if;
      return Result;
   end To_Number;

   function To_Number (Str : String) return T is
      package T_IO is new Ada.Text_IO.Integer_IO (T);
      Result : T;
      Last   : Positive;
   begin
      T_IO.Get (Str, Result, Last);
      if Last /= Str'Last then
         Result := 0;
      end if;
      return Result;
   end To_Number;

   function To_String (Number : T) return String is
      Img : constant String := Number'Image;
      Str : constant String :=
        (if Number >= 0 then Img (2 .. Img'Last) else Img);
   begin
      return Str;
   end To_String;

end Euler_Tools;
