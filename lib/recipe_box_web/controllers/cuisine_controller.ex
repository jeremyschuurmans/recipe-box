defmodule RecipeBoxWeb.CuisineController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.Cuisine
  
  @doc """
  The conn is the Plug connection. 
  The Plug takes a connection and returns a connection,
  and the conn is a struct that
  contains all the information (body, cookies, headers ...).
  """
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
