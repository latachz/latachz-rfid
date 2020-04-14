# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rfid_latachz, RfidLatachz.Repo,
  database: "rfid_latachz_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :rfid_latachz,
  ecto_repos: [RfidLatachz.Repo]

# Configures the endpoint
config :rfid_latachz, RfidLatachzWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b6PrJLAcB45qfqSm2kIlRYIBu47MgDJNzwEgtiqDFeHhEPD872NIVwpFQ5Laned/",
  render_errors: [view: RfidLatachzWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RfidLatachz.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
