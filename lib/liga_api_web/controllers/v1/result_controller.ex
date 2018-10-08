defmodule LigaApiWeb.V1.ResultController do
  @moduledoc false
  use LigaApiWeb, :controller

  alias LigaApi.Result

  def index(conn, params) do
    season_league_pair = Map.fetch!(params, "season_league_pair")
    [division, season] = String.split(season_league_pair)
    results = Result.all_by_division_and_season(%{division: division, season: season})
    case results do
      [] -> render(put_status(conn, 404), "index.json", %{data: results})
      _ -> render(conn, "index.json", %{data: results})
    end
  end
end
