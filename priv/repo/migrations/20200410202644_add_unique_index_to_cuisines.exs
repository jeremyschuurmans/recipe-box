defmodule RecipeBox.Repo.Migrations.AddUniqueIndexToCuisines do
  use Ecto.Migration

  def change do
    create unique_index(:cuisines, [:name])
  end
end
