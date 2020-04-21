defmodule RecipeBoxWeb.PageControllerTest do
  use RecipeBoxWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert "/cuisines" = redirected_to(conn, 302)
  end
end
