use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :splurty, Splurty.Endpoint,
  url: [host: "splurty-sample.herokuapp.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "B63HIlHs1umvS+7y2cjBQAckNV54rbV4Ipf5hZ+xrp4Vl9qRW4v6wqdsAJiStmEy"

# Do not pring debug messages in production
config :logger, level: :info

config :phoenix, :database, url: System.get_env("DATABASE_URL")

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :splurty, Splurty.Endpoint, server: true
#
