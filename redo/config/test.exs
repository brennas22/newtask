use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :redo, RedoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :redo, Redo.Repo,
  username: "redo",
  password: "teacher105",
  database: "redo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
