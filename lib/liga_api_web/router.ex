defmodule LigaApiWeb.Router do
  use LigaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LigaApiWeb do
    pipe_through :api
  end
end
