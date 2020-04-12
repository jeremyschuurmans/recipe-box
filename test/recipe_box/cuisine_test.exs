defmodule RecipeBox.CuisineTest do
  use RecipeBox.DataCase, async: true

  alias RecipeBox.Cuisine

   describe "create_cuisine/1" do
     @valid_attrs %{
       name: "Italian"
     }

     @invalid_attrs %{}

     test "with valid data inserts cuisine" do
       assert {:ok, %Cuisine{id: id}=cuisine} = Cuisine.create_cuisine(@valid_attrs)
       assert cuisine.name == "italian"
     end

     test "does not insert duplicate cuisine" do
       assert {:ok, %Cuisine{id: id}} = Cuisine.create_cuisine(@valid_attrs)
       assert {:error, changeset} = Cuisine.create_cuisine(@valid_attrs)
       assert errors_on(changeset) == %{name: ["has already been taken"]}
     end

     test "does not insert blank cuisine" do
       assert {:error, changeset} = Cuisine.create_cuisine(@invalid_attrs)
       assert errors_on(changeset) == %{name: ["can't be blank"]}
     end
   end

  describe "list_cuisines/0" do
     @valid_attrs1 %{
       name: "Breakfast"
     }

     @valid_attrs2 %{
       name: "Second Breakfast"
     }

     test "returns all cuisines" do
       %Cuisine{id: id1} = cuisine_fixture()
       assert [%Cuisine{id: ^id1}] = Cuisine.list_cuisines() 

       %Cuisine{id: id2} = cuisine_fixture(@valid_attrs1)
       assert [%Cuisine{id: ^id1}, %Cuisine{id: ^id2}] = Cuisine.list_cuisines()

       %Cuisine{id: id3} = cuisine_fixture(@valid_attrs2)
       assert [%Cuisine{id: ^id1}, %Cuisine{id: ^id2}, %Cuisine{id: ^id3}] = Cuisine.list_cuisines()


     end
  end

  describe "alphabetize_cuisines/1" do
    @valid_attrs1 %{
      name: "Breakfast"
    }

    @valid_attrs2 %{
      name: "Second Breakfast"
    }

    @valid_attrs3 %{
      name: "Elevenses"
    }

    test "returns cuisines in alphabetical order" do
      %Cuisine{} = cuisine_fixture(@valid_attrs1)
      %Cuisine{} = cuisine_fixture(@valid_attrs2)
      %Cuisine{} = cuisine_fixture(@valid_attrs3)

      cuisines = Cuisine.list_cuisines()

      assert ["breakfast", "elevenses", "second breakfast"] = Cuisine.alphabetize_cuisines(cuisines)
    end
  end
end
