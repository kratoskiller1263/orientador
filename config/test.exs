import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :orientador, OrientadorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DE+7clBy40wp780Q40SlSLA6CXVR5mlCeitMnj/7v06tOMAeXaGujUVHGqyDvV2a",
  server: false

# In test we don't send emails.
config :orientador, Orientador.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
