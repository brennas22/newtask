defmodule Redo.Repo do
  use Ecto.Repo,
    otp_app: :redo,
    adapter: Ecto.Adapters.Postgres
end
