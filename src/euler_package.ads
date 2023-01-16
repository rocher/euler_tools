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

generic
   type Int_Type is range <>;

package Euler_Package is

   subtype Integer_Type is Int_Type;

   package List_Package is new Ada.Containers.Doubly_Linked_Lists (Int_Type);

   subtype List_Type is List_Package.List;

   function All_Divisors (Number : Int_Type) return List_Type;
   --  Returns the (unsorted) list of all divisors of Number, including 1 and
   --  Number.

   function Collatz_First (Number : Int_Type) return Int_Type;
   --  Sets and returns the first number in the Collatz sequence starting at
   --  Number, which happens to be Number.

   function Collatz_Next return Int_Type;
   --  Returns the next number in the Collatz sequence, defined by:
   --  Collatz_Next = N/2 if N is even, and Collatz_Next = 3*N+1 if N is odd,
   --  where N is the previous number in the Collatz sequence.

   function Combination (N, K : Int_Type) return Int_Type;
   --  Returns the combinatorial number of N over K.

   function Concat (Left, Right : Int_Type) return Int_Type;
   --  Returns the number obtained by concatenating Left and Right numbers,
   --  when Right is not negative. Returns 0 if Right is negative.

   function Factorial (Number : Int_Type) return Int_Type;
   --  Return the factorial of Number: 2 * 3 * .. * Number.

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

   function Is_Divisor (Number, Divisor : Int_Type) return Boolean;
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

   function Proper_Divisors (Number : Int_Type) return List_Type;
   --  Returns the (unsorted) list of proper divisors of Number (excludes
   --  Number).

   function Square_Root (Number : Int_Type) return Int_Type;
   --  Return the truncated square root of Number if Number > 0, 0 otherwise.

   function Sum (Number_List : List_Type) return Int_Type;
   --  Return the sum of all numbers of the list.

   function Sum_Multiples
     (N : Int_Type; Upper_Bound : Int_Type) return Int_Type;
   --  Returns the sum of all numbers multiples of N less or equal than
   --  Upper_Bound: Sum_Multiples (3, 100) = 3 + 6 + 9 + .. + 99.

   function Sum_Sequence (Upper_Bound : Int_Type) return Int_Type;
   --  Returns the sum of all numbers from 1 to Upper_Bound.

   function Sum_Squares (Upper_Bound : Int_Type) return Int_Type;
   --  Returns the sum of the squares of all numbers from 1 to Upper_Bound.

   function Tens (Number : Int_Type) return Int_Type;
   --  Returns the tens of Number.

   function Thousands (Number : Int_Type) return Int_Type;
   --  Returns the thousands of Number.

   function To_Number (Chr : Character) return Int_Type;
   --  Returns the value of Chr converted to typ T if Chr in '0' .. '9', 0
   --  otherwise.

   function To_Number (Str : String) return Int_Type;
   --  Returns the value of Str converted to type T is Str(I) in '0' .. '9',
   --  0 otherwise. Optionally, Str'First can be the sign '-' or '+'.

   function To_String (Number : Int_Type) return String;
   --  Returns a String with the value of Number. Removes leading whitespace.

   function Units (Number : Int_Type) return Int_Type;
   --  Returns the last digit (units) of Number.

end Euler_Package;
