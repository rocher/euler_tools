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

with Ada.Containers.Doubly_Linked_Lists;
with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;

generic
   type Int_Type is range <>;

package Euler_Package is

   subtype Integer_Type is Int_Type;

   package List_Package is new Ada.Containers.Doubly_Linked_Lists (Int_Type);
   subtype List_Type is List_Package.List;
   Empty_List : constant List_Type := List_Package.Empty_List;

   package Set_Package is new Ada.Containers.Ordered_Sets (Int_Type);
   subtype Set_Type is Set_Package.Set;

   subtype Numeral_Type is Natural range 0 .. 9;

   package Numeral_Package is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Numeral_Type);

   subtype Crumbled_Natural is Numeral_Package.Vector;
   --  Crumbled_Natural type is a representation or an arbitrary long Natural
   --  type, regardless of the particular type instantiated in the generic
   --  package.

   CN_Empty : constant Crumbled_Natural := Numeral_Package.Empty_Vector;
   CN_Zero  : constant Crumbled_Natural := [0];

   type Detailed_Division_Type is record
      Dividend   : Int_Type;
      Divisor    : Int_Type;
      Quotient   : Int_Type;
      Decimals   : Crumbled_Natural := CN_Empty;
      Cycle      : Natural;
      Remainders : List_Type        := Empty_List;
   end record;

   function All_Divisors (Number : Int_Type) return Set_Type;
   --  Returns the set of all divisors of Number, including 1 and Number.

   function Are_Amicable (A, B : Int_Type) return Boolean;
   --  Return True is A and B are an amicable pair: A and B are amicable if
   --  Sum (Proper_Divisors (A)) = B  and  Sum (Proper_Divisors (B)) = A.

   function Collatz_First (Number : Int_Type) return Int_Type;
   --  Sets and returns the first number in the Collatz sequence starting at
   --  Number, which happens to be Number.

   procedure CN_Assign (Left : in out Crumbled_Natural; Right : Int_Type);
   --  Assigns the value of Right number to the Crumbled_Naturals of the
   --  Left.

   procedure CN_Assign (Left : in out Int_Type; Right : Crumbled_Natural);
   --  Assigns the value of the Crumbled_Natural in the Right to the Left
   --  number.

   procedure CN_Assign
     (Left                   : in out Int_Type; Right : Crumbled_Natural;
      Digit_Start, Digit_End :        Positive) with
     Pre => Digit_Start <= Digit_End;
   --  Assigns the value of the Crumbled_Natural in the Right to the Left
   --  number using digits from Digit_Start to Digit_End.

   function Collatz_Next return Int_Type;
   --  Returns the next number in the Collatz sequence, defined by:
   --  Collatz_Next = N/2 if N is even, and Collatz_Next = 3*N+1 if N is odd,
   --  where N is the previous number in the Collatz sequence.

   function Combination (N, K : Int_Type) return Int_Type with
     Pre => 0 <= N and then 0 <= K and then K <= N;
   --  Returns the combinatorial number of N over K.

   function Concat (Left, Right : Int_Type) return Int_Type with
     Pre => Right >= 0;
   --  Returns the number obtained by concatenating Left and Right numbers.

   --  procedure Divide (Numerator: Int_Type; Denominator : Int_Type)

   function Detailed_Division
     (Dividend, Divisor : Int_Type; Decimals : Natural)
      return Detailed_Division_Type with
     Pre => Divisor /= 0;
   --  Returns the "detailed division" of Dividend / Divisor with a maximum
   --  number of Decimals in the Quotient. It mimics the manual operation of
   --  dividing both numbers up to a certain number of decimals.

   function Element_First (Set : Set_Type) return Int_Type with
     Pre => not Set.Is_Empty;
   --  Returns the first element of the ordered, non-empty Set.

   function Element_Nth (Set : Set_Type; Nth : Natural) return Int_Type with
     Pre => not Set.Is_Empty;
   --  Return the Nth element of the ordered, non-empty Set.

   function Factorial (Number : Int_Type) return Int_Type with
     Pre => Number >= 0;
   --  Return the factorial of Number: 1* 2 * 3 * .. * Number.

   function Fibonacci_Start return Int_Type;
   --  Returns the first generated Fibonacci number from the initial terms 1
   --  and 1, which happens to be equal to 2, and resets the sequence
   --  generator.

   function Fibonacci_Start (A, B : Int_Type) return Int_Type;
   --  Resets the Fibonacci sequence generator to start with the numbers A
   --  and B, and return the first generated Fibonacci number (A + B).

   function Fibonacci_Next return Int_Type;
   --  Returns the next Fibonacci number.

   function Hundreds (Number : Int_Type) return Int_Type;
   --  Returns the hundreds of Number.

   function Is_Abundant (Number : Int_Type) return Boolean;
   --  Returns True if the sum of the proper divisors of Number is greater
   --  than itself: Sum (Proper_Divisors (Number)) > Number

   function Is_Deficient (Number : Int_Type) return Boolean;
   --  Returns True if the sum of the proper divisors of Number is lesser
   --  than itself: Sum (Proper_Divisors (Number)) < Number

   function Is_Divisor (Number, Divisor : Int_Type) return Boolean with
     Pre => Divisor /= 0;
   --  Returns True is Number can by evenly divided by Divisor.

   function Is_Even (Number : Int_Type) return Boolean;
   --  Returns True is Number is even.

   function Is_Odd (Number : Int_Type) return Boolean;
   --  Returns True is Number is odd.

   function Is_Palindrome (Number : Int_Type) return Boolean;
   --  Returns True if Number is the same read from left to right and right
   --  to left.

   function Is_Perfect (Number : Int_Type) return Boolean;
   --  Returns True if the sum of the proper divisors of Number is equal to
   --  itself: Sum (Proper_Divisors (Number)) = Number

   function Is_Prime (Number : Int_Type) return Boolean;
   --  Returns True if Number is prime.

   function Prime_First return Int_Type;
   --  Returns the first prime number (2) and resets the internal prime
   --  number generator.

   function Prime_Next return Int_Type;
   --  Returns the next prime number. Requires calling the function
   --  Prime_First to start the sequence.

   function Prime_Nth (Nth : Int_Type) return Int_Type;
   --  Returns the Nth prime number.

   function Proper_Divisors (Number : Int_Type) return Set_Type;
   --  Returns the set of proper divisors of Number (that is, excluding
   --  Number). If Number is equal to 1, then returns the empty set.

   function Square_Root (Number : Int_Type) return Int_Type with
     Pre => Number >= 0;
   --  Return the truncated square root of Number if Number > 0, 0 otherwise.

   function Sum (Set : Set_Type) return Int_Type;
   --  Return the sum of all numbers of the set.

   function Sum_Multiples
     (Number : Int_Type; Upper_Bound : Int_Type) return Int_Type;
   --  Returns the sum of all numbers multiples of Number less or equal than
   --  Upper_Bound. e.g. Sum_Multiples (3, 100) = 3 + 6 + 9 + .. + 99.

   function Sum_Sequence (Number : Int_Type) return Int_Type;
   --  Returns the sum of all numbers from 1 to Number.

   function Sum_Squares (Number : Int_Type) return Int_Type;
   --  Returns the sum of the squares of all numbers from 1 to Number.

   function Tens (Number : Int_Type) return Int_Type;
   --  Returns the tens of Number.

   function Thousands (Number : Int_Type) return Int_Type;
   --  Returns the thousands of Number.

   function To_Number (Chr : Character) return Int_Type with
     Pre => (Chr in '0' .. '9');
   --  Returns the value of Chr converted to typ T if Chr in '0' .. '9', 0
   --  otherwise.

   function To_Number (Str : String) return Int_Type with
     Pre => (for all S of Str => S in '0' .. '9');
   --  Returns the value of Str converted to Integer_Type.

   function To_String (Number : Int_Type) return String;
   --  Returns a String with the value of Number. Removes leading whitespace.

   function Units (Number : Int_Type) return Int_Type;
   --  Returns the last digit (units) of Number.

end Euler_Package;
