defmodule Pusemit.Games.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :spelling, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:spelling])
    |> validate_required([:spelling])
  end
end
