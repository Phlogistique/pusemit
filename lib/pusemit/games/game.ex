defmodule Pusemit.Games.Game do
  @moduledoc """
  hoo wah
  """
  use Ecto.Schema

  import Ecto.Changeset
  alias Pusemit.Games.Player
  alias Pusemit.Games.Word

  schema "games" do
    field :name, :string

    has_many :players, Player
    has_many :words, Word

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
