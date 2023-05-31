defmodule SimpleApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc """
  Application that starts the http router for `SimpleApp`.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, 
        scheme: :http, 
        plug: SimpleAppRouter, 
        options: [port: (System.get_env("PORT") || "8080") |> String.to_integer()]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
