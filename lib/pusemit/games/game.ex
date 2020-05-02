defmodule Pusemit.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :players, :id
    field :words, :id

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [])
    |> validate_required([])
  end
end
