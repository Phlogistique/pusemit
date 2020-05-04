defmodule Pusemit.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      timestamps()
    end

    create table(:words) do
      add :spelling, :string
      add :game_id, references(:games, on_delete: :delete_all), null: false

      timestamps()
    end

    create table(:players) do
      add :name, :string
      add :game_id, references(:games, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
