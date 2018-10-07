defmodule LigaApiWeb.V1.ResultView do
  use LigaApiWeb, :view

  def render("index.json", %{data: results}) do
    %{results: render_many(results, LigaApiWeb.V1.ResultView, "result.json")}
  end

  def render("result.json", %{result: result}) do
    %{
      division: result.division,
      season: result.season,
      date: result.date,
      home_team: result.home_team,
      away_team: result.away_team,
      fthg: result.fthg,
      ftag: result.ftag,
      ftr: result.ftr,
      hthg: result.hthg,
      htag: result.htag,
      htr: result.htr
    }
  end
end
