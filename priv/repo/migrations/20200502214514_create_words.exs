defmodule Pusemit.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :spelling, :string

      timestamps()
    end

  end
end
