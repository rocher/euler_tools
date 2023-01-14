package Euler_Text is

   function To_Words (Number : Natural) return String with
     Pre => Number <= 9_999;
   --  Returns the Number written out in words.

end Euler_Text;
