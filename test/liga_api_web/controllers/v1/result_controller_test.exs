defmodule LigaApiWeb.V1.ResultControllerTest do
  use LigaApiWeb.ConnCase
  alias LigaApi.Factory

  describe "index/2" do
    test "return 404 and an empty json result if nothing found", %{conn: conn} do
      response =
        conn
        |> get(result_path(conn, :index), %{season_league_pair: "SP1 20172018"})
        |> json_response(404)

      assert %{"results" => []} == response
    end

    test "return a json result", %{conn: conn} do
      Factory.insert!(:result)
      Factory.insert!(:result)

      response =
        conn
        |> get(result_path(conn, :index), %{season_league_pair: "SP1 20172018"})
        |> json_response(200)

      assert response == %{
               "results" => [
                 %{
                   "away_team" => "Eibar",
                   "date" => "2018-01-01",
                   "division" => "SP1",
                   "ftag" => 1,
                   "fthg" => 2,
                   "ftr" => "H",
                   "home_team" => "La Coruna",
                   "htag" => 0,
                   "hthg" => 0,
                   "htr" => "D",
                   "season" => 20_172_018
                 },
                 %{
                   "away_team" => "Eibar",
                   "date" => "2018-01-01",
                   "division" => "SP1",
                   "ftag" => 1,
                   "fthg" => 2,
                   "ftr" => "H",
                   "home_team" => "La Coruna",
                   "htag" => 0,
                   "hthg" => 0,
                   "htr" => "D",
                   "season" => 20_172_018
                 }
               ]
             }
    end
  end
end
