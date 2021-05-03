defmodule RebornWeb.Router do
  use RebornWeb, :router
  import Phoenix.LiveDashboard.Router
  import Plug.BasicAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admins_auth do
    plug :basic_auth, Application.compile_env(:reborn_app, :basic_auth)
  end

  pipeline :live_dashboard_counter do
    plug RebornWeb.Plugs.Counter
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/app", RebornWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", RebornWeb do
    pipe_through [:browser, :admins_auth, :live_dashboard_counter]

    live_dashboard "/", metrics: RebornWeb.Telemetry, ecto_repos: [Reborn.Repo]
  end

  # Other scopes may use custom stacks.
  # scope "/api", RebornWeb do
  #   pipe_through :api
  # end
end
