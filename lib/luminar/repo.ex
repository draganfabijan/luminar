defmodule Luminar.Repo do
  use Ecto.Repo,
    otp_app: :luminar,
    adapter: Ecto.Adapters.Postgres
end
