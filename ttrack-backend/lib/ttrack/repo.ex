defmodule Ttrack.Repo do
  use Ecto.Repo,
    otp_app: :ttrack,
    adapter: Ecto.Adapters.Postgres
end
