defmodule RecipeBoxWeb.CuisineController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.Cuisine
  
  def index(conn, _params) do
    cuisines = Cuisine
    |> Cuisine.alphabetize 
    |> Cuisine.list_cuisines()
    render(conn, "index.html", cuisines: cuisines)
  end

  def new(conn, params) do
    changeset = Cuisine.changeset(%Cuisine{}, params)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cuisine" => cuisine_params}) do
    case Cuisine.create_cuisine(cuisine_params) do
      {:ok, _params} ->
        conn
          |> put_flash(:info, "Success!")
          |> redirect(to: Routes.cuisine_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
