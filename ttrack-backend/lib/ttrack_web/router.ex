defmodule TtrackWeb.Router do
  use TtrackWeb, :router

  pipeline :authenticated do
    plug TtrackWeb.RequireLogin, repo: Auth.Repo
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Doorman.Login.Session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :fetch_session
    plug Doorman.Login.Session
    plug :accepts, ["json"]
  end

  scope "/api", TtrackWeb do
    pipe_through(:api)
    # post "/register", UserController, :register
    post "/login", SessionController, :create
    post "/register", UserController, :register
  end

  scope "/api", TtrackWeb do
    pipe_through [:api, :authenticated]

    get "/kek", UserController, :kek
  end



  scope "/", TtrackWeb do
    pipe_through :browser

    # get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TtrackWeb do
  #   pipe_through :api
  # end
end
