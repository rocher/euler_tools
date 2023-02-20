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

use Euler_Tools.Set_Package;

with Text_IO;

package body Set_Tests is

   ----------
   -- Name --
   ----------

   overriding function Name (T : Set_Test_Case) return Test_String is
     (Format ("Set Tests                "));

   --------------------
   -- Register_Tests --
   --------------------

   overriding procedure Register_Tests (T : in out Set_Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Type_Size'Access, "Type size");
      Register_Routine (T, Test_Element_First'Access, "Element_First");
      Register_Routine (T, Test_Element_Nth'Access, "Element_Nth");
      Register_Routine (T, Test_Sum'Access, "Sum");
   end Register_Tests;

   --------------------
   -- Test_Type_Size --
   --------------------

   procedure Test_Type_Size (T : in out Test_Cases.Test_Case'Class) is
   begin
      Text_IO.Put_Line ("   Empty_Set'Size =" & Empty_Set'Size'Image);
   end Test_Type_Size;

   ------------------------
   -- Test_Element_First --
   ------------------------

   procedure Test_Element_First (T : in out Test_Cases.Test_Case'Class) is

      Set : Set_Type := Empty_Set;
   begin
      Assert (Element_First (Set) = 0, "Invalid first element");

      Set.Insert (10);
      Assert (Element_First (Set) = 10, "Invalid first element");

      Set.Insert (4);
      Set.Insert (3);
      Assert (Element_First (Set) = 3, "Invalid first element");

      Set.Insert (7);
      Set.Insert (8);
      Assert (Element_First (Set) = 3, "Invalid first element");

      Set.Insert (2);
      Set.Insert (1);
      Assert (Element_First (Set) = 1, "Invalid first element");
   end Test_Element_First;

   ----------------------
   -- Test_Element_Nth --
   ----------------------

   procedure Test_Element_Nth (T : in out Test_Cases.Test_Case'Class) is
      Set : Set_Type := Empty_Set;
   begin
      Set.Insert (10);
      Assert (Element_Nth (Set, 1) = 10, "Invalid nth element");

      Set.Insert (4);
      Set.Insert (3);
      Assert (Element_Nth (Set, 1) = 3, "Invalid nth element");

      Set.Insert (7);
      Set.Insert (8);
      Assert (Element_Nth (Set, 4) = 8, "Invalid nth element");

      Set.Insert (2);
      Set.Insert (1);
      Assert (Element_Nth (Set, 1) = 1, "Invalid nth element");
      Assert (Element_Nth (Set, 2) = 2, "Invalid nth element");
      Assert (Element_Nth (Set, 3) = 3, "Invalid nth element");
      Assert (Element_Nth (Set, 4) = 4, "Invalid nth element");
      Assert (Element_Nth (Set, 5) = 7, "Invalid nth element");
      Assert (Element_Nth (Set, 6) = 8, "Invalid nth element");
      Assert (Element_Nth (Set, 7) = 10, "Invalid nth element");
   end Test_Element_Nth;

   --------------
   -- Test_Sum --
   --------------

   procedure Test_Sum (T : in out Test_Cases.Test_Case'Class) is
      Set : Set_Type := Empty_Set;
   begin
      Assert (Sum (Set) = 0, "Invalid sum of elements");

      Set.Insert (1);
      Assert (Sum (Set) = 1, "Invalid sum of elements");

      Set.Insert (2);
      Assert (Sum (Set) = 3, "Invalid sum of elements");

      Set.Insert (3);
      Set.Insert (4);
      Assert (Sum (Set) = 10, "Invalid sum of elements");

      Set.Insert (200);
      Set.Insert (90);
      Assert (Sum (Set) = 300, "Invalid sum of elements");
   end Test_Sum;

end Set_Tests;
