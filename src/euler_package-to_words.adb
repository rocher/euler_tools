with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

separate (Euler_Package)
function To_Words (Number : Int_Type) return String is

   function Tus (Source : String) return Unbounded_String renames
     To_Unbounded_String;

   Name_Unit : constant array (0 .. 9) of Unbounded_String :=
     [Tus ("zero"), Tus ("one"), Tus ("two"), Tus ("three"), Tus ("four"),
     Tus ("five"), Tus ("six"), Tus ("seven"), Tus ("eight"), Tus ("nine")];

   Name_Tens : constant array (10 .. 19) of Unbounded_String :=
     [Tus ("ten"), Tus ("eleven"), Tus ("twelve"), Tus ("thirteen"),
     Tus ("fourteen"), Tus ("fifteen"), Tus ("sixteen"), Tus ("seventeen"),
     Tus ("eighteen"), Tus ("nineteen")];

   Name_Tenth : constant array (2 .. 9) of Unbounded_String :=
     [Tus ("twenty"), Tus ("thirty"), Tus ("forty"), Tus ("fifty"),
     Tus ("sixty"), Tus ("seventy"), Tus ("eighty"), Tus ("ninety")];

   Name_Power_10 : constant array (2 .. 3) of Unbounded_String :=
     [Tus ("hundred"), Tus ("thousand")];

begin

   return "";

end To_Words;
