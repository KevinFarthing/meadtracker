defmodule MeadtrackerWeb.Router do
  use MeadtrackerWeb, :router

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

  scope "/", MeadtrackerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", MeadtrackerWeb do
    pipe_through :api

    get "/batches", BatchController, :index
    get "/batches/:id", BatchController, :show
  end
end
