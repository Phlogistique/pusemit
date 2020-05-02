defmodule Pusemit.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :players, references(:players, on_delete: :nothing)
      add :words, references(:words, on_delete: :nothing)

      timestamps()
    end

    create index(:games, [:players])
    create index(:games, [:words])
  end
end
