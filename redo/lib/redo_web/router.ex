defmodule RedoWeb.Router do
  use RedoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RedoWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ajax do
   plug :accepts, ["json"]
   plug :fetch_session
   plug :fetch_flash
   plug RedoWeb.Plugs.FetchSession
 end

  scope "/", RedoWeb do
    pipe_through :browser
    get "/", PageController, :index

    resources "/tasks", TaskController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  scope "/ajax", RedoWeb do
    pipe_through :ajax
    resources "/time_blocks", Time_blockController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", RedoWeb do
  #   pipe_through :api
  # end
end
