# API Reference

## Packages

   - `Euler_Package`: generic package that can be instantiated with any
     `range <>` type. For example, `Integer` or `Long_Integer`. Do not use it
     directly. Instead, use one of the following instantiations.

   - `Euler_Tools`: Euler package instantiated with `Integer` type. In a
     'x86_64' computer it is 64 bits long, resulting in `Naturals` in the
     range $[0, 2^{64}-1]$.

   - `Euler_Tools_Int1`: Euler package instantiated with `Long_Integer`. This
     is implementation-dependent and, probably, the same length as `Integer`.

   - `Euler_Tools_Int2`: Euler packages instantiated with
     `Long_Long_Integer`.
   
   - `Euler_Tools_Int3`: Euler packages instantiated with
     `Long_Long_Long_Integer`.

## Types

   - `Integer_Type`: each Euler tools package mentioned above provides this
     type (the type used to instantiate the Euler package). This facilitates
     writing algorithms independent of the any integer length used.

   - `List_Type`: this is an `Ada.Containers.Doubly_Linked_Lists` of
     `Integer_Type`.
   
   - `Set_Type`: this is an `Ada.Containers.Ordered_Set` of `Integer_Type`.

   - `Crumbled_Natural`: this is an `Ada.Containers.Vector` of
     `Numeral_Type`.

## Functions

#### function All_Divisors (Number : Int_Type) return Set_Type;
   - Returns the set of all divisors of `Number`, including 1 and `Number`.
   - Unit tests: [divisors_tests.adb](src/divisors_tests.adb)
   -  Example:
      ```ada
         Divisors : Set_Type := All_Divisors (10);
         --  Divisors = [1, 2, 5, 10];
      ```

#### function Are_Amicable (A, B : Int_Type) return Boolean;
   - Return True is $A$ and $B$ are an *amicable pair*: $A$ and $B$ are
     amicable if
     $$\sum Proper\\_Divisors (A) = B$$
     and
     $$\sum Proper\\_Divisors (B) = A$$
   - **Precondition**: $A > 0$ and $B > 0$.
   - Unit tests: [divisors_tests.adb](src/divisors_tests.adb)
   - Ref: [Amicable numbers](https://en.wikipedia.org/wiki/Amicable_numbers)
   - Example:
     $$\sum Proper\\_Divisors (220) = \sum \\{1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110\\} = 284$$
     $$\sum Proper\\_Divisors (284) = \sum \brace{aa} 1, 2, 4, 71, 142 = 220$$

