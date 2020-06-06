# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :luminar,
  ecto_repos: [Luminar.Repo]

# Configures the endpoint
config :luminar, LuminarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w8U+xri3JfASWi7VYvvGGfduXkjrUoHPXJUNMj9y4WbfWh6USACGChXsvOZual/o",
  render_errors: [view: LuminarWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Luminar.PubSub,
  live_view: [signing_salt: "9ktgedFP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
