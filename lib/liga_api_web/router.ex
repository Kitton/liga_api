defmodule LigaApiWeb.Router do
  use LigaApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/v1", LigaApiWeb.V1 do
    pipe_through(:api)

    get("/season_league_pairs", SeasonLeaguePairsController, :index)
    get("/results", ResultController, :index)
  end
end
