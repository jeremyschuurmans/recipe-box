# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipe_box,
  ecto_repos: [RecipeBox.Repo]

# Configures the endpoint
config :recipe_box, RecipeBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kXp+A3ud/aDH2O/NtgSV9IG4/r/HFgFc0W2DbYv6J7zp2BmQ43oZePcpjNof2uqY",
  render_errors: [view: RecipeBoxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RecipeBox.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Becmu0EE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
