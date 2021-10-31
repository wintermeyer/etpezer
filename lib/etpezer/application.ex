defmodule Etpezer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Etpezer.Repo,
      # Start the Telemetry supervisor
      EtpezerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Etpezer.PubSub},
      # Start the Endpoint (http/https)
      EtpezerWeb.Endpoint
      # Start a worker by calling: Etpezer.Worker.start_link(arg)
      # {Etpezer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Etpezer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EtpezerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
