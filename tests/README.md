<img src="../Ada_for_Project_Euler.png" width="200" />


# Euler Tools
### Euler Tools v1.0.0

| function / procedure                                                                                          | Unit test                                                |
|---------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| All_Divisors (N)                                                                                              | [divisors tests](src/divisors_tests.adb)                 |
| Are_Amicable (A, B)                                                                                           | [divisors tests](src/divisors_tests.adb)                 |
| CN_Assign (CN, Integer)                                                                                       | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| CN_Assign (Integer, CN)                                                                                       | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| CN_Assign (Integer, CN, range)                                                                                | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| Collatz_First                                                                                                 |                                                          |
| Collatz_Next                                                                                                  |                                                          |
| Combination (N, K)                                                                                            | [factorial tests](src/factorial_tests.adb)               |
| Concat (A, B)                                                                                                 | [numeric tests](src/numeric_tests.adb)                   |
| function All_Divisors (Number : Int_Type) return Set_Type;                                                    |                                                          |
| function Are_Amicable (A, B : Int_Type) return Boolean;                                                       |                                                          |
| procedure CN_Assign (Left : in out Crumbled_Natural; Right : Int_Type);                                       |                                                          |
| procedure CN_Assign (Left : in out Int_Type; Right : Crumbled_Natural);                                       |                                                          |
| procedure CN_Assign   (Left : in out Int_Type; Right : Crumbled_Natural;  Digit_Start, Digit_End : Positive); |                                                          |
| function Collatz_First (Number : Int_Type) return Int_Type;                                                   |                                                          |
| function Collatz_Next return Int_Type;                                                                        |                                                          |
| function Combination (N, K : Int_Type) return Int_Type;                                                       |                                                          |
| function Concat (Left, Right : Int_Type) return Int_Type;                                                     |                                                          |
| function Decimal_Division  (Dividend, Divisor : Int_Type; Decimals : Natural)  return Decimal_Division_Type;  |                                                          |
| procedure Decimal_Division_Increase  (DDiv : in out Decimal_Division_Type; Decimals : Natural);               |                                                          |
| function Element_First (Set : Set_Type) return Int_Type;                                                      |                                                          |
| function Element_Nth (Set : Set_Type; Nth : Natural) return Int_Type;                                         |                                                          |
   function Equals (List : List_Type) return Boolean with
     Pre => not List.Is_Empty;
   --  Returns True if all element of the list are equal.

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

   function Left (Number : Int_Type; Positions : Positive) return Int_Type;
   --  Returns the number formed by the leftmost digit Positions of Number.

   function Length (Number : Crumbled_Natural) return Natural;
   --  Returns the Length of the Crumbled_Natural Number;

   function Length (Number : Integer_Type) return Natural;
   --  Returns the total number of digits in Number.

   function Length (List : List_Type) return Natural;
   --  Returns the number of elements in the List.

   function Length (Set : Set_Type) return Natural;
   --  Returns the number of elements in Set.

   function Prime_Factors (Number : Int_Type) return List_Type;
   --  Returns the list of prime factors of Number.

   function Prime_First return Int_Type;
   --  Returns the first prime number (2) and resets the internal prime
   --  number generator.

   function Prime_Next return Int_Type;
   --  Returns the next prime number. Requires calling the function
   --  Prime_First to start the sequence.

   function Prime_Nth (Nth : Int_Type) return Int_Type;
   --  Returns the Nth prime number.

   function Product (List : List_Type) return Int_Type with
     Pre => not List.Is_Empty;
   --  Returns the product of all numbers in List.

   function Proper_Divisors (Number : Int_Type) return Set_Type;
   --  Returns the set of proper divisors of Number (that is, excluding
   --  Number). If Number is equal to 1, then returns the empty set.

   function Right (Number : Int_Type; Positions : Positive) return Int_Type;
   --  Return the number formed by the rightmost digit Positions of Number.

   procedure Sort (List : in out List_Type);
   --  Sorts the List of numbers in place.

   function Square_Root (Number : Int_Type) return Int_Type with
     Pre => Number >= 0;
   --  Return the truncated square root of Number if Number > 0, 0 otherwise.

   function Sub_Number
     (Number : Int_Type; Start, Length : Positive) return Int_Type;
   --  Return the number formed with the digits of Number from Start position
   --  up to the specified Length (mimics the Sub_String function). Returns 0
   --  if Start is greater than the Number length. Returns less that Length
   --  digits if there are no enough digits in Number from the Start.

   function Sum (List : List_Type) return Int_Type with
     Pre => not List.Is_Empty;
   --  Returns the sum of all number of the List.

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
