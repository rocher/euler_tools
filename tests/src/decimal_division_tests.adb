--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--   _____      _             _____           _       _____         _
--  | ____|   _| | ___ _ __  |_   _|__   ___ | |___  |_   _|__  ___| |_ ___
--  |  _|| | | | |/ _ \ '__|   | |/ _ \ / _ \| / __|   | |/ _ \/ __| __/ __|
--  | |__| |_| | |  __/ |      | | (_) | (_) | \__ \   | |  __/\__ \ |_\__ \
--  |_____\__,_|_|\___|_|      |_|\___/ \___/|_|___/   |_|\___||___/\__|___/
--
-- ----------------------------------------------------------------------------

with AUnit.Assertions; use AUnit.Assertions;

with Euler_Tools; use Euler_Tools;
use Euler_Tools.Numeral_Package;

with Text_IO;

package body Decimal_Division_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name
     (T : Decimal_Division_Test_Case) return Test_String is
     (Format ("Decimal_Division Tests   "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Decimal_Division_Test_Case)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Decimal_Division'Access, "Decimal_Division");
      Register_Routine
        (T, Test_Decimal_Division_Increase'Access,
         "Decimal_Division_Increase");
   end Register_Tests;

   ---------------------------
   -- Test_Decimal_Division --
   ---------------------------

   procedure Test_Decimal_Division (T : in out Test_Case'Class) is
      DDiv, RDiv : Decimal_Division_Type;
   begin
      DDiv := Decimal_Division (0, 1, 0);
      RDiv := (0, 1, 0, [], 0, [0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 1, 0);
      RDiv := (1, 1, 1, [], 0, [0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (2, 1, 0);
      RDiv := (2, 1, 2, [], 0, [0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (100, 5, 0);
      RDiv := (100, 5, 20, [], 0, [0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (100, 5, 7);
      RDiv := (100, 5, 20, [], 0, [0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (111, 5, 0);
      RDiv := (111, 5, 22, [], 0, [1]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (111, 5, 1);
      RDiv := (111, 5, 22, [2], 0, [1, 0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (111, 5, 7);
      RDiv := (111, 5, 22, [2], 0, [1, 0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (127, 4, 0);
      RDiv := (127, 4, 31, [], 0, [3]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (127, 4, 1);
      RDiv := (127, 4, 31, [7], 0, [3, 2]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (127, 4, 2);
      RDiv := (127, 4, 31, [7, 5], 0, [3, 2, 0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (127, 4, 5);
      RDiv := (127, 4, 31, [7, 5], 0, [3, 2, 0]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 0);
      RDiv := (63_322, 195, 324, [], 0, [142]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 1);
      RDiv := (63_322, 195, 324, [7], 0, [142, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 2);
      RDiv := (63_322, 195, 324, [7, 2], 0, [142, 55, 160]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 3);
      RDiv := (63_322, 195, 324, [7, 2, 8], 0, [142, 55, 160, 40]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 4);
      RDiv := (63_322, 195, 324, [7, 2, 8, 2], 0, [142, 55, 160, 40, 10]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 5);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0], 0, [142, 55, 160, 40, 10, 100]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 6);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5], 0,
         [142, 55, 160, 40, 10, 100, 25]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 7);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 8);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (63_322, 195, 9);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (767, 99, 0);
      RDiv := (767, 99, 7, [], 0, [74]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (767, 99, 1);
      RDiv := (767, 99, 7, [7], 0, [74, 47]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (767, 99, 2);
      RDiv := (767, 99, 7, [7, 4], 1, [74, 47, 74]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (767, 99, 5);
      RDiv := (767, 99, 7, [7, 4], 1, [74, 47, 74]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (632, 18, 0);
      RDiv := (632, 18, 35, [], 0, [2]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (632, 18, 1);
      RDiv := (632, 18, 35, [1], 1, [2, 2]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (632, 18, 2);
      RDiv := (632, 18, 35, [1], 1, [2, 2]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 44, 0);
      RDiv := (1, 44, 0, [], 0, [1]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 44, 1);
      RDiv := (1, 44, 0, [0], 0, [1, 10]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 44, 2);
      RDiv := (1, 44, 0, [0, 2], 0, [1, 10, 12]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 44, 3);
      RDiv := (1, 44, 0, [0, 2, 2], 0, [1, 10, 12, 32]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (1, 44, 4);
      RDiv := (1, 44, 0, [0, 2, 2, 7], 3, [1, 10, 12, 32, 12]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      --  checked with https://www.mathsisfun.com/calculator-precision.html
      DDiv := Decimal_Division (1, 443, 221);
      RDiv :=
        (1, 443, 0,
         [0, 0, 2, 2, 5, 7, 3, 3, 6, 3, 4, 3, 1, 1, 5, 1, 2, 4, 1, 5, 3, 4, 9,
         8, 8, 7, 1, 3, 3, 1, 8, 2, 8, 4, 4, 2, 4, 3, 7, 9, 2, 3, 2, 5, 0, 5,
         6, 4, 3, 3, 4, 0, 8, 5, 7, 7, 8, 7, 8, 1, 0, 3, 8, 3, 7, 4, 7, 1, 7,
         8, 3, 2, 9, 5, 7, 1, 1, 0, 6, 0, 9, 4, 8, 0, 8, 1, 2, 6, 4, 1, 0, 8,
         3, 5, 2, 1, 4, 4, 4, 6, 9, 5, 2, 5, 9, 5, 9, 3, 6, 7, 9, 4, 5, 8, 2,
         3, 9, 2, 7, 7, 6, 5, 2, 3, 7, 0, 2, 0, 3, 1, 6, 0, 2, 7, 0, 8, 8, 0,
         3, 6, 1, 1, 7, 3, 8, 1, 4, 8, 9, 8, 4, 1, 9, 8, 6, 4, 5, 5, 9, 8, 1,
         9, 4, 1, 3, 0, 9, 2, 5, 5, 0, 7, 9, 0, 0, 6, 7, 7, 2, 0, 0, 9, 0, 2,
         9, 3, 4, 5, 3, 7, 2, 4, 6, 0, 4, 9, 6, 6, 1, 3, 9, 9, 5, 4, 8, 5, 3,
         2, 7, 3, 1, 3, 7, 6, 9, 7, 5, 1, 6, 9, 3],
         1,
         [1, 10, 100, 114, 254, 325, 149, 161, 281, 152, 191, 138, 51, 67, 227,
         55, 107, 184, 68, 237, 155, 221, 438, 393, 386, 316, 59, 147, 141, 81,
         367, 126, 374, 196, 188, 108, 194, 168, 351, 409, 103, 144, 111, 224,
         25, 250, 285, 192, 148, 151, 181, 38, 380, 256, 345, 349, 389, 346,
         359, 46, 17, 170, 371, 166, 331, 209, 318, 79, 347, 369, 146, 131,
         424, 253, 315, 49, 47, 27, 270, 42, 420, 213, 358, 36, 360, 56, 117,
         284, 182, 48, 37, 370, 156, 231, 95, 64, 197, 198, 208, 308, 422, 233,
         115, 264, 425, 263, 415, 163, 301, 352, 419, 203, 258, 365, 106, 174,
         411, 123, 344, 339, 289, 232, 105, 164, 311, 9, 90, 14, 140, 71, 267,
         12, 120, 314, 39, 390, 356, 16, 160, 271, 52, 77, 327, 169, 361, 66,
         217, 398, 436, 373, 186, 88, 437, 383, 286, 202, 248, 265, 435, 363,
         86, 417, 183, 58, 137, 41, 410, 113, 244, 225, 35, 350, 399, 3, 30,
         300, 342, 319, 89, 4, 40, 400, 13, 130, 414, 153, 201, 238, 165, 321,
         109, 204, 268, 22, 220, 428, 293, 272, 62, 177, 441, 423, 243, 215,
         378, 236, 145, 121, 324, 139, 61, 167, 341, 309, 432, 333, 229, 75,
         307, 412, 133, 1]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

   end Test_Decimal_Division;

   ------------------------------------
   -- Test_Decimal_Division_Increase --
   ------------------------------------

   procedure Test_Decimal_Division_Increase (T : in out Test_Case'Class) is
      DDiv, RDiv : Decimal_Division_Type;
   begin
      DDiv := Decimal_Division (63_322, 195, 0);
      RDiv := (63_322, 195, 324, [], 0, [142]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 1);
      RDiv := (63_322, 195, 324, [7], 0, [142, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 2);
      RDiv := (63_322, 195, 324, [7, 2], 0, [142, 55, 160]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 3);
      RDiv := (63_322, 195, 324, [7, 2, 8], 0, [142, 55, 160, 40]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 4);
      RDiv := (63_322, 195, 324, [7, 2, 8, 2], 0, [142, 55, 160, 40, 10]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 5);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0], 0, [142, 55, 160, 40, 10, 100]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 6);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5], 0,
         [142, 55, 160, 40, 10, 100, 25]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 7);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 8);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 9);
      RDiv :=
        (63_322, 195, 324, [7, 2, 8, 2, 0, 5, 1], 2,
         [142, 55, 160, 40, 10, 100, 25, 55]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      DDiv := Decimal_Division (127, 31, 0);
      RDiv := (127, 31, 4, [], 0, [3]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 3);
      RDiv := (127, 31, 4, [0, 9, 6], 0, [3, 30, 21, 24]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 10);
      RDiv :=
        (127, 31, 4, [0, 9, 6, 7, 7, 4, 1, 9, 3, 5], 0,
         [3, 30, 21, 24, 23, 13, 6, 29, 11, 17, 15]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

      Decimal_Division_Increase (DDiv, 20);
      RDiv :=
        (127, 31, 4, [0, 9, 6, 7, 7, 4, 1, 9, 3, 5, 4, 8, 3, 8, 7], 1,
         [3, 30, 21, 24, 23, 13, 6, 29, 11, 17, 15, 26, 12, 27, 22, 3]);
      --  Text_IO.Put_Line (DDiv'Image);
      Assert (DDiv = RDiv, "Invalid Decimal division");

   end Test_Decimal_Division_Increase;

end Decimal_Division_Tests;
