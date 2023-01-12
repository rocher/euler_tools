with Ada.Containers.Doubly_Linked_Lists;

generic
   type T is range <>;

package Euler_Tools is

   package List_Package is new Ada.Containers.Doubly_Linked_Lists (T);

   subtype List_Type is List_Package.List;

   function Collatz_First (Number : T) return T;
   --  Sets and returns the first number in the Collatz sequence starting at
   --  Number, which happens to be Number.

   function Collatz_Next return T;
   --  Returns the next number in the Collatz sequence, defined by:
   --  Collatz_Next = N/2 if N is even, and Collatz_Next = 3*N+1 if N is odd,
   --  where N is the previous number in the Collatz sequence.

   function Combination (N, K : T) return T;
   --  Returns the combinatorial number of N over K.

   function Concat (Left, Right : T) return T;
   --  Returns the number obtained by concatenating Left and Right numbers,
   --  when Right is not negative. Returns 0 if Right is negative.

   function Factorial (Number : T) return T;
   --  Return the factorial of Number: 2 * 3 * .. * Number.

   function Factors (Number : T) return List_Type;
   --  Returns all factors of Number, including 1 and Number.

   function Is_Palindrome (Number : T) return Boolean;
   --  Returns True if Number is the same read from left to right and right
   --  to left.

   function Is_Prime (Number : T) return Boolean;
   --  Returns True if Number is prime.

   function Prime_First return T;
   --  Returns the first prime number (2) and resets the internal prime
   --  number generator.

   function Prime_Next return T;
   --  Returns the next prime number. Requires calling the function
   --  Prime_First to start the sequence.

   function Prime_Nth (N : T) return T;
   --  Returns the Nth prime number.

   function Sum_Multiples (N : T; Upper_Bound : T) return T;
   --  Returns the sum of all numbers multiples of N less or equal than
   --  Upper_Bound: Sum_Multiples (3, 100) = 3 + 6 + 9 + .. + 99.

   function Sum_Sequence (Upper_Bound : T) return T;
   --  Returns the sum of all numbers from 1 to Upper_Bound.

   function Sum_Squares (Upper_Bound : T) return T;
   --  Returns the sum of the squares of all numbers from 1 to Upper_Bound.

   function To_Number (Chr : Character) return T;
   --  Returns the value of Chr converted to typ T if Chr in '0' .. '9', 0
   --  otherwise.

   function To_Number (Str : String) return T;
   --  Returns the value of Str converted to type T is Str(I) in '0' .. '9',
   --  0 otherwise. Optionally, Str'First can be the sign '-' or '+'.

   function To_String (Number : T) return String;
   --  Returns a String with the value of Number. Removes leading whitespace.

end Euler_Tools;
