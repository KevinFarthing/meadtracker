defmodule Meadtracker.Repo do
  use Ecto.Repo,
    otp_app: :meadtracker,
    adapter: Ecto.Adapters.Postgres
end
