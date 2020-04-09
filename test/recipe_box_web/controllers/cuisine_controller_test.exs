defmodule RecipeBoxWeb.CuisineControllerTest do
  use RecipeBoxWeb.ConnCase
  alias RecipeBox.Cuisine

  test "GET /new", %{conn: conn} do
    conn = get(conn, "/cuisines/new")
    assert html_response(conn, 200) =~ "Add a new cuisine"
  end

  test "POST /cuisines creates a new cuisine" do
    # need to figure out how to do this
  end

  test "GET /index lists all cuisines", %{conn: conn} do
    cuisines = [
      %{name: "Italian"},
      %{name: "Midwestern American"},
      %{name: "Thai"}
    ]

    [{:ok, cuisine1}, {:ok, cuisine2}, {:ok, cuisine3}] = Enum.map(cuisines, &Cuisine.create_cuisine(&1))

    conn = get(conn, "/cuisines")
    assert html_response(conn , 200) =~ "Cuisines"
  end
end

