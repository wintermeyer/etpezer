defmodule Etpezer.Repo do
  use Ecto.Repo,
    otp_app: :etpezer,
    adapter: Ecto.Adapters.Postgres
end
