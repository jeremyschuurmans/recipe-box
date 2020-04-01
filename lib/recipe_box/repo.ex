defmodule RecipeBox.Repo do
  use Ecto.Repo,
    otp_app: :recipe_box,
    adapter: Ecto.Adapters.Postgres
end
