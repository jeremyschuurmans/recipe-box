defmodule RecipeBox.TestHelpers do
  alias RecipeBox.Cuisine

  def cuisine_fixture(attrs \\ %{}) do
    {:ok, cuisine} = 
      attrs
      |> Enum.into(%{name: "Midwestern American"})
      |> Cuisine.create_cuisine()
    cuisine
  end
end
