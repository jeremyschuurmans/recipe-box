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
end
