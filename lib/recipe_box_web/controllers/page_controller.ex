defmodule RecipeBoxWeb.PageController do
  use RecipeBoxWeb, :controller

  def index(conn, _params) do
    conn |> redirect(to: Routes.cuisine_path(conn, :index))
  end
end
