use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rfid_latachz, RfidLatachzWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rfid_latachz, RfidLatachz.Repo,
  username: "erkvaieflqdggn",
  password: "d6ba3e6c7077f3993f53389d9ccf2d1097fe90a0dd227d91ee03ab33dfc3ea9f",
  database: "dd957n0a8gv1it",
  hostname: "ec2-54-247-72-30.eu-west-1.compute.amazonaws.com",
  ssl: true,
  pool: Ecto.Adapters.SQL.Sandbox
