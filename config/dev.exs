use Mix.Config

config :splurty, Splurty.Endpoint,
  http: [port: System.get_env("PORT") || 3000],
  debug_errors: true,
  cache_static_lookup: false

# Enables code reloading for development
config :phoenix, :code_reloader, true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

config :phoenix, :database, url: "ecto://ecto:labadiena@localhost/splurty_production"