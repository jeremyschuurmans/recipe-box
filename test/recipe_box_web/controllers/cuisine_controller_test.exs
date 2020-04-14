defmodule RecipeBoxWeb.CuisineControllerTest do
  use RecipeBoxWeb.ConnCase

  test "GET /new", %{conn: conn} do
    conn = get(conn, "/cuisines//new")
    assert html_response(conn, 200) =~ "Create Cuisine"
  end
end

