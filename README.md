[![Alire](https://img.shields.io/endpoint?url=https://alire.ada.dev/badges/euler_tools.json)](https://alire.ada.dev/crates/euler_tools.html)
[![Alire CI/CD](https://img.shields.io/endpoint?url=https://alire-crate-ci.ada.dev/badges/euler_tools.json)](https://alire-crate-ci.ada.dev/crates/euler_tools.html)
![unit-test](https://github.com/rocher/euler_tools/actions/workflows/unit-test.yml/badge.svg)
[![GitHub release](https://img.shields.io/github/release/rocher/euler_tools.svg)](https://github.com/rocher/euler_tools/releases/latest)
[![License](https://img.shields.io/github/license/rocher/euler_tools.svg?color=blue)](https://github.com/rocher/euler_tools/blob/master/LICENSE)

<img src="Ada_for_Project_Euler.png" width="200" />

# Euler Tools

> *Assortment of Ada functions to solve [Project
> Euler](https://projecteuler.net) problems.*

Euler Tools is an Ada 2022 library of functions that contains _usual_
mathematical functions and _non-usual_ numeric functions, like concatenation
of numbers, palindrome checking or the length (number of digits) of a number.

New functions are added to the library from each solved problem: common
functionality that can be abstracted, and possibly reused in other problems,
becomes an Euler Tools function.

For example, to solve [problem 3](https://projecteuler.net/problem=3) you
need to deal with prime numbers and to check if a given number evenly divides
another one. Also, to reduce the search space, divisors checked start with
the squared root of a number. Thus, three functions are used from Euler
Tools: `Square_Root`, `Is_Divisor` and `Is_Prime`.

---
## Current Status and Future Plans

Euler Tools is currently in its very early stage.

New functions are being added very often, some are re-implemented, some
optimized, or specifications change according to some criteria. But to make
things clear, the set of unit tests included in the library can be used to understand a function specification.

New Ada 2022 features are expected to be supported by compilers soon. Some
features are really interesting to Euler Tools, like parallel blocks, and it
will be used as they are available.

Ada pre- and post-conditions are used in some function specifications. The
plan is to improve and generalize its use. SPARK is also planned to be used.

---
## Installation

### Build

Use [Alire](https://alire.ada.dev) to get and compile the library:
```sh
alr get euler_tools
cd euler_tools*
alr build
```

### Unit tests

To compile and run the unit tests:
```sh
cd tests
alr build
./bin/euler_tools_tests
```

Traceability matrix of functions vs unit tests is [provided here](tests/README.md).

---
## Design

### Euler Package

Main component of Euler Tools is a _generic_ package, `Euler_Package (<>)`,
that can be instantiated with any integer type, from `Integer` to
`Long_Long_Long_Integer`.

Some instantiations are provided as separate packages:

   *  `package Euler_Tools is new Euler_Package (Integer)`
   *  `package Euler_Tools_Int1 is new Euler_Package (Long_Integer)`
   *  `package Euler_Tools_Int2 is new Euler_Package (Long_Long_Integer)`
   *  `package Euler_Tools_Int3 is new Euler_Package (Long_Long_Long_Integer)`

Each platform provides different representation of type, ranging from 32 or
64 bits for `Integer`, or 128 bits for `Long_Long_Long_Integer`.

  Each package provides also the `Integer_Type` that has been used to
  instantiate `Euler_Package (<>)`. This is a convenient type to easily
  change from one package to another without having to rewrite the integer
  type used. For example, you can start solving a problem with
  `Euler_Tools`:

 ```ada
   with Text_IO;     use Text_IO;
   with Euler_Tools; use Euler_Tools;

   procedure Problem_42 is
      Answer : Integer_Type := Factorial (12);
   begin
      Put_Line ("Answer:" & Answer'Image);
   end Problem_42;
 ```

  If later on you realize that `Integer` is not big enough, the you can try
  with a longer type simply by replacing the Euler package:

```ada
   with Text_IO;          use Text_IO;
   with Euler_Tools_Int3; use Euler_Tools_Int3;

   procedure Problem_42 is
      Answer : Integer_Type := Factorial (33);
   begin
      Put_Line ("Answer:" & Answer'Image);
   end Problem_42;
```

### Other Packages

Other packages included in Euler Tools are:

   * `Euler_Calendar`, that provides a function to get the weekday of a date
    (YYYY/MM/DD).
   * `Euler_Text`, that implements a function that return a number written
     out in words.

### Additional Types

Solving mathematical problems usually require not only `Integer_Type`, but
more complex types. Euler Tools contains the following types for your
convenience:

   * `List_Type` is a list of `Integer_Type`. It is a doubly linked list, so
     elements can be visited in both directions (see
     `Ada.Containers.Doubly_Linked_Lists`).
   * `Set_Type` is a set of `Integer_Type`. You can `Insert` new numbers,
     `Include` possibly repeated numbers, make it an `Empty_Set`, get the
     `Length` (cardinality) of a set, etc. It is an _ordered set_, so
     elements of a set are always visited in order (see
     `Ada.Containers.Ordered_Sets`).
   * `Numeral_Type` is `range 0 .. 9` (4 bits long), a subtype used in other
     types.
   * `Crumbled_Natural` is an arbitrary long natural number composed as a
     vector of numerals. Contrast with Ada 2022 package
     `Ada.Numerics.Big_Numbers.Big_Integers`.
   * `Decimal_Division_Type` is used to perform arbitrary precision
     divisions. For example, problem 26 requires really long divisions
     (spoiler: recurring cycle of $1/n$ contains 982 digits, for some
     $n<1000$).

---
## Euler Examples

Please check some Project Euler solutions provided as example of use of Euler
Tools  in [Euler Examples](https://github.com/rocher/euler_examples)
repository.

### Contributions

Please feel free to

   * Use Euler Tools to solve Project Euler or other mathematical problems:
     send us the link to you work and we'll it include in this section.
   * Send contributions, ideas and suggestions to improve Euler Tools
     functions or implementations.

---
## License
MIT (c) 2023 Francesc Rocher