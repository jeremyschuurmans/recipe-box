defmodule RecipeBoxWeb.CuisineControllerTest do
  use RecipeBoxWeb.ConnCase
  
  alias RecipeBox.Cuisine

  test "GET /new", %{conn: conn} do
    conn = get(conn, "/cuisines/new")
    assert html_response(conn, 200) =~ "Create Cuisine"
  end

  test "POST /cuisines creates a new cuisine" do
    conn = post(build_conn(), "/cuisines", cuisine: [name: "Russian"])

    assert "/cuisines" = redirected_to(conn, 302)

    conn = get(conn, "/cuisines")

    assert html_response(conn, 200) =~ "russian" 
  end

  test "GET /index lists all cuisines", %{conn: conn} do
    cuisines = [
      %{name: "Italian"},
      %{name: "Midwestern American"},
      %{name: "Thai"}
    ]

    [{:ok, cuisine1}, {:ok, cuisine2}, {:ok, cuisine3}] = Enum.map(cuisines, &Cuisine.create_cuisine(&1))

    conn = get(conn, "/cuisines")
    assert html_response(conn, 200) =~ "Cuisines"
    assert html_response(conn, 200) =~ cuisine1.name
    assert html_response(conn, 200) =~ cuisine2.name
    assert html_response(conn, 200) =~ cuisine3.name
  end
end

