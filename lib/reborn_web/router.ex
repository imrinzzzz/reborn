defmodule RebornWeb.Router do
  use RebornWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RebornWeb do
    pipe_through :browser

    live_dashboard "/", metrics: RebornWeb.Telemetry, ecto_repos: [Reborn.Repo]
    get "/welcome", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RebornWeb do
  #   pipe_through :api
  # end
end
