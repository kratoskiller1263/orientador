defmodule Orientador.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OrientadorWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Orientador.PubSub},
      # Start Finch
      {Finch, name: Orientador.Finch},
      # Start the Endpoint (http/https)
      OrientadorWeb.Endpoint
      # Start a worker by calling: Orientador.Worker.start_link(arg)
      # {Orientador.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Orientador.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OrientadorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
