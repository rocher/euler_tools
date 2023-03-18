[![Alire](https://img.shields.io/endpoint?url=https://alire.ada.dev/badges/euler_tools.json)](https://alire.ada.dev/crates/euler_tools.html)
![unit-test](https://github.com/rocher/euler_tools/actions/workflows/unit-test.yml/badge.svg)
[![GitHub release](https://img.shields.io/github/release/rocher/euler_tools.svg)](https://github.com/rocher/euler_tools/releases/latest)
[![License](https://img.shields.io/github/license/rocher/euler_tools.svg?color=blue)](https://github.com/rocher/euler_tools/blob/master/LICENSE)

<img src="../Ada_for_Project_Euler.png" width="200" />


# Euler Tools

Traceability matrix of library functions / unit tests.

| function / procedure                                                                                          | Unit test                                                |
| ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| function All_Divisors (Number : Int_Type) return Set_Type;                                                    | [divisors tests](src/divisors_tests.adb)                 |
| function Are_Amicable (A, B : Int_Type) return Boolean;                                                       | [divisors tests](src/divisors_tests.adb)                 |
| procedure CN_Assign (Left : in out Crumbled_Natural; Right : Int_Type);                                       | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| procedure CN_Assign (Left : in out Int_Type; Right : Crumbled_Natural);                                       | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| procedure CN_Assign   (Left : in out Int_Type; Right : Crumbled_Natural;  Digit_Start, Digit_End : Positive); | [crumbled naturals test](src/crumbled_natural_tests.adb) |
| function Collatz_Next (Number : Int_Type) return Int_Type;                                                    | pending                                                  |
| function Combination (N, K : Int_Type) return Int_Type;                                                       | [factorial tests](src/factorial_tests.adb)               |
| function Concat (Left, Right : Int_Type) return Int_Type;                                                     | [numeric tests](src/numeric_tests.adb)                   |
| function Decimal_Division  (Dividend, Divisor : Int_Type; Decimals : Natural)  return Decimal_Division_Type;  | [decimal division tests](src/decimal_division_tests.adb) |
| procedure Decimal_Division_Increase  (DDiv : in out Decimal_Division_Type; Decimals : Natural);               | [decimal division tests](src/decimal_division_tests.adb) |
| function Element_First (Set : Set_Type) return Int_Type;                                                      | [set tests](src/set_tests.adb)                           |
| function Element_Nth (Set : Set_Type; Nth : Natural) return Int_Type;                                         | [set tests](src/set_tests.adb)                           |
| function Equals (List : List_Type) return Boolean;                                                            | [list tests](src/list_tests.adb)                         |
| function Factorial (Number : Int_Type) return Int_Type;                                                       | [factorial tests](src/factorial_tests.adb)               |
| function Fibonacci_Start return Int_Type;                                                                     | [Fibonacci tests](src/fibonacci_tests.adb)               |
| function Fibonacci_Start (A, B : Int_Type) return Int_Type;                                                   | [Fibonacci tests](src/fibonacci_tests.adb)               |
| function Fibonacci_Next return Int_Type;                                                                      | [Fibonacci tests](src/fibonacci_tests.adb)               |
| function Hundreds (Number : Int_Type) return Int_Type;                                                        | [numeric tests](src/numeric_tests.adb)                   |
| function Is_Abundant (Number : Int_Type) return Boolean;                                                      | [divisors tests](src/divisors_tests.adb)                 |
| function Is_Deficient (Number : Int_Type) return Boolean;                                                     | [divisors tests](src/divisors_tests.adb)                 |
| function Is_Divisor (Number, Divisor : Int_Type) return Boolean;                                              | [divisors tests](src/divisors_tests.adb)                 |
| function Is_Even (Number : Int_Type) return Boolean;                                                          | [numeric tests](src/numeric_tests.adb)                   |
| function Is_Odd (Number : Int_Type) return Boolean;                                                           | [numeric tests](src/numeric_tests.adb)                   |
| function Is_Palindrome (Number : Int_Type) return Boolean;                                                    | [numeric tests](src/numeric_tests.adb)                   |
| function Is_Perfect (Number : Int_Type) return Boolean;                                                       | [divisors tests](src/divisors_tests.adb)                 |
| function Is_Prime (Number : Int_Type) return Boolean;                                                         | [prime tests](src/prime_tests.adb)                       |
| function Left (Number : Int_Type; Positions : Positive) return Int_Type;                                      | [numeric tests](src/numeric_tests.adb)                   |
| function Length (Number : Crumbled_Natural) return Natural;                                                   | *length of*  `Ada.Containers.Vector`                     |
| function Length (Number : Integer_Type) return Natural;                                                       | [numeric tests](src/numeric_tests.adb)                   |
| function Length (List : List_Type) return Natural;                                                            | *length of* `Ada.Containers.Doubly_Linked_Lists`         |
| function Length (Set : Set_Type) return Natural;                                                              | *length of* `Ada.Containers.Ordered_Sets`                |
| function Prime_Factors (Number : Int_Type) return List_Type;                                                  | [prime tests](src/prime_tests.adb)                       |
| function Prime_First (Cursor : in out Prime_Cursor_Type) return Int_Type;                                     | [prime tests](src/prime_tests.adb)                       |
| function Prime_Next (Cursor : in out Prime_Cursor_Type; Nth : Int_Type := 1) return Int_Type;                 | [prime tests](src/prime_tests.adb)                       |
| function Prime_Nth (Nth : Int_Type) return Int_Type;                                                          | [prime tests](src/prime_tests.adb)                       |
| function Product (List : List_Type) return Int_Type;                                                          | [list tests](src/list_tests.adb)                         |
| function Proper_Divisors (Number : Int_Type) return Set_Type;                                                 | [divisors tests](src/divisors_tests.adb)                 |
| function Right (Number : Int_Type; Positions : Positive) return Int_Type;                                     | [numeric tests](src/numeric_tests.adb)                   |
| procedure Sort (List : in out List_Type);                                                                     | *sort algorithm in Doubly_Linked_Lists*                  |
| function Square_Root (Number : Int_Type) return Int_Type;                                                     | *square root of* `Float`                                 |
| function Sub_Number   (Number : Int_Type; Start, Length : Positive) return Int_Type;                          | [numeric tests](src/numeric_tests.adb)                   |
| function Sum (List : List_Type) return Int_Type;                                                              | [list tests](src/list_tests.adb)                         |
| function Sum (Set : Set_Type) return Int_Type;                                                                | [set tests](src/set_tests.adb)                           |
| function Sum_Multiples (Number : Int_Type; Upper_Bound : Int_Type) return Int_Type;                           | [sum tests](src/sum_tests.adb)                           |
| function Sum_Sequence (Number : Int_Type) return Int_Type;                                                    | [sum tests](src/sum_tests.adb)                           |
| function Sum_Squares (Number : Int_Type) return Int_Type;                                                     | [sum tests](src/sum_tests.adb)                           |
| function Tens (Number : Int_Type) return Int_Type;                                                            | [numeric tests](src/numeric_tests.adb)                   |
| function Thousands (Number : Int_Type) return Int_Type;                                                       | [numeric tests](src/numeric_tests.adb)                   |
| function To_Number (Chr : Character) return Int_Type;                                                         | [numeric tests](src/numeric_tests.adb)                   |
| function To_Number (Str : String) return Int_Type;                                                            | [numeric tests](src/numeric_tests.adb)                   |
| function To_String (Number : Int_Type) return String;                                                         | [numeric tests](src/numeric_tests.adb)                   |
| function Units (Number : Int_Type) return Int_Type;                                                           | [numeric tests](src/numeric_tests.adb)                   |
