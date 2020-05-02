defmodule Pusemit.Repo do
  use Ecto.Repo,
    otp_app: :pusemit,
    adapter: Ecto.Adapters.Postgres
end
