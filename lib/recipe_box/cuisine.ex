defmodule RecipeBox.Cuisine do
  @moduledoc """
  This is the Cuisine context
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  
  alias RecipeBox.Cuisine
  alias RecipeBox.Repo
  
  @doc """
  This specifies the database table and corresponding Elixir struct at the same time.
  Generate a migration file by running mix ecto.gen.migration create_cuisines.
  """
  schema "cuisines" do
    field :name, :string

    timestamps()
  end
  
  @doc """
  Changesets allow Ecto to manage record changes.
  The cast function allows only the specified fields into the DB and nothing else.
  """
  def changeset(cuisine, attrs) do
    cuisine
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def downcase_name(changeset) do
    update_change(changeset, :name, &String.downcase/1)
  end
  
  def create_cuisine(attrs \\ %{}) do
    %Cuisine{}
    |> Cuisine.changeset(attrs)
    |> Repo.insert()
  end

  def list_cuisines() do
    Repo.all(Cuisine)
  end

  def alphabetize(query) do
    query
    |> order_by([c], c.name)
  end
end

