defmodule LigaApiWeb.V1.SeasonLeaguePairsControllerTest do
  use LigaApiWeb.ConnCase
  alias LigaApi.Factory

  describe "index/2" do
    test "return an empty json result", %{conn: conn} do
      response =
        conn
        |> get(season_league_pairs_path(conn, :index))
        |> json_response(404)

      assert %{"season_league_pairs" => []} == response
    end

    test "return pproperly read data", %{conn: conn} do
      Factory.insert!(:result)

      response =
        conn
        |> get(season_league_pairs_path(conn, :index))
        |> json_response(200)

      assert %{"season_league_pairs" => ["SP1 20172018"]} == response
    end
  end
end
