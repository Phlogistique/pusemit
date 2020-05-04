defmodule Pusemit.Games.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :spelling, :string

    belongs_to :game, Game

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:spelling, :game_id])
    |> validate_required([:spelling, :game_id])
  end
end
