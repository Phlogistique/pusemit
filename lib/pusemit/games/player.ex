defmodule Pusemit.Games.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pusemit.Games.Game

  schema "players" do
    field :name, :string

    belongs_to :game, Game

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :game_id])
    |> validate_required([:name, :game_id])
  end
end
