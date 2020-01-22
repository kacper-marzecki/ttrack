# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ttrack,
  ecto_repos: [Ttrack.Repo]

# Configures the endpoint
config :ttrack, TtrackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "avtKcgWEfMeUFVZpF3H1ocuj9H/49IzuhBBMZJPi4nXiFrwqUjryKKPOap1mS3bc",
  render_errors: [view: TtrackWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ttrack.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :doorman,
  repo: Ttrack.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Ttrack.User

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
