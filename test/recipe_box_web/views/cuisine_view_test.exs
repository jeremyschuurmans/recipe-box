defmodule RecipeBoxWeb.CuisineViewTest do
  use RecipeBoxWeb.ConnCase, async: true
  import Phoenix.View

  alias RecipeBox.Cuisine

  test "renders new.html, displaying new cuisine form", %{conn: conn} do
    changeset = Cuisine.changeset(%Cuisine{}, %{})

    content = render_to_string(
      RecipeBoxWeb.CuisineView,
      "new.html",
      conn: conn,
      changeset: changeset
    )

    assert content =~ "Create Cuisine"
  end
end
