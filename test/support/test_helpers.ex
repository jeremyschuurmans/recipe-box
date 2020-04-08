defmodule RecipeBox.TestHelpers do
  alias RecipeBox.Cuisines

  def cuisine_fixture(attrs \\ %{}) do
    {:ok, cuisine} = 
      attrs
      |> Enum.into(%{name: "Midwestern American"})
      |> Cuisines.create_cuisine()
    cuisine
  end
end
