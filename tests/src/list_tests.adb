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
with Euler_Tools;      use Euler_Tools;

package body List_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Lists_Test_Case) return Test_String is
     (Format ("List Tests               "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Lists_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Equals'Access, "Equals");
      Register_Routine (T, Test_Product'Access, "Product");
      Register_Routine (T, Test_Sum'Access, "Sum");
   end Register_Tests;

   -----------------
   -- Test_Equals --
   -----------------

   procedure Test_Equals (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Equals ([1]), "Invalid Equals result");
      Assert (Equals ([2, 2]), "Invalid Equals result");
      Assert (Equals ([3, 3, 3, 3]), "Invalid Equals result");
      Assert (Equals ([4, 4, 4, 4, 4, 4, 4]), "Invalid Equals result");
      Assert
        (not Equals ([1, 1, 1, 1, 1, 2, 1, 1, 1]), "Invalid Equals result");
   end Test_Equals;

   ------------------
   -- Test_Product --
   ------------------

   procedure Test_Product (T : in out Test_Cases.Test_Case'Class) is
   begin
      Assert (Product ([0]) = 0, "Invalid Product result");
      Assert (Product ([1]) = 1, "Invalid Product result");
      Assert (Product ([0, 1]) = 0, "Invalid Product result");
      Assert (Product ([1, 1, 1]) = 1, "Invalid Product result");
      Assert (Product ([1, 2, 3]) = 6, "Invalid Product result");
      Assert (Product ([4, 4, 4, 4]) = 256, "Invalid Product result");
      Assert (Product ([1, 2, 1, 1, 1]) = 2, "Invalid Product result");
      Assert
        (Product ([2, 5, 5, 5, 89, 123]) = 2_736_750,
         "Invalid Product result");
   end Test_Product;

   --------------
   -- Test_Sum --
   --------------

   procedure Test_Sum (T : in out Test_Cases.Test_Case'Class) is
      List : List_Type;
   begin
      List := [0];
      Assert (Sum (List) = 0, "Invalid Sum result");

      List := [1];
      Assert (Sum (List) = 1, "Invalid Sum result");

      List := [0, 1];
      Assert (Sum (List) = 1, "Invalid Sum result");

      List := [1, 1, 1];
      Assert (Sum (List) = 3, "Invalid Sum result");

      List := [1, 2, 3];
      Assert (Sum (List) = 6, "Invalid Sum result");

      List := [4, 4, 4, 4];
      Assert (Sum (List) = 16, "Invalid Sum result");

      List := [1, 2, 1, 1, 1];
      Assert (Sum (List) = 6, "Invalid Sum result");

      List := [2, 5, 5, 5, 89, 123];
      Assert (Sum (List) = 229, "Invalid Sum result");
   end Test_Sum;

end List_Tests;
