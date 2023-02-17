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
| function Equals (List : List_Type) return Boolean;                                                            |                                                          |
| function Factorial (Number : Int_Type) return Int_Type;                                                       |                                                          |
| function Fibonacci_Start return Int_Type;                                                                     |                                                          |
| function Fibonacci_Start (A, B : Int_Type) return Int_Type;                                                   |                                                          |
| function Fibonacci_Next return Int_Type;                                                                      |                                                          |
| function Hundreds (Number : Int_Type) return Int_Type;                                                        |                                                          |
| function Is_Abundant (Number : Int_Type) return Boolean;                                                      |                                                          |
| function Is_Deficient (Number : Int_Type) return Boolean;                                                     |                                                          |
| function Is_Divisor (Number, Divisor : Int_Type) return Boolean;                                              |                                                          |
| function Is_Even (Number : Int_Type) return Boolean;                                                          |                                                          |
| function Is_Odd (Number : Int_Type) return Boolean;                                                           |                                                          |
| function Is_Palindrome (Number : Int_Type) return Boolean;                                                    |                                                          |
| function Is_Perfect (Number : Int_Type) return Boolean;                                                       |                                                          |
| function Is_Prime (Number : Int_Type) return Boolean;                                                         |                                                          |
| function Left (Number : Int_Type; Positions : Positive) return Int_Type;                                      |                                                          |
| function Length (Number : Crumbled_Natural) return Natural;                                                   |                                                          |
| function Length (Number : Integer_Type) return Natural;                                                       |                                                          |
| function Length (List : List_Type) return Natural;                                                            |                                                          |
| function Length (Set : Set_Type) return Natural;                                                              |                                                          |
| function Prime_Factors (Number : Int_Type) return List_Type;                                                  |                                                          |
| function Prime_First return Int_Type;                                                                         |                                                          |
| function Prime_Next return Int_Type;                                                                          |                                                          |
| function Prime_Nth (Nth : Int_Type) return Int_Type;                                                          |                                                          |
| function Product (List : List_Type) return Int_Type;                                                          |                                                          |
| function Proper_Divisors (Number : Int_Type) return Set_Type;                                                 |                                                          |
| function Right (Number : Int_Type; Positions : Positive) return Int_Type;                                     |                                                          |
| procedure Sort (List : in out List_Type);                                                                     |                                                          |
| function Square_Root (Number : Int_Type) return Int_Type;                                                     |                                                          |
| function Sub_Number   (Number : Int_Type; Start, Length : Positive) return Int_Type;                          |                                                          |
| function Sum (List : List_Type) return Int_Type;                                                              |                                                          |
| function Sum (Set : Set_Type) return Int_Type;                                                                |                                                          |
| function Sum_Multiples     (Number : Int_Type; Upper_Bound : Int_Type) return Int_Type;                       |                                                          |
| function Sum_Sequence (Number : Int_Type) return Int_Type;                                                    |                                                          |
| function Sum_Squares (Number : Int_Type) return Int_Type;                                                     |                                                          |
| function Tens (Number : Int_Type) return Int_Type;                                                            |                                                          |
| function Thousands (Number : Int_Type) return Int_Type;                                                       |                                                          |
| function To_Number (Chr : Character) return Int_Type;                                                         |                                                          |
| function To_Number (Str : String) return Int_Type;                                                            |                                                          |
| function To_String (Number : Int_Type) return String;                                                         |                                                          |
| function Units (Number : Int_Type) return Int_Type;                                                           |                                                          |
