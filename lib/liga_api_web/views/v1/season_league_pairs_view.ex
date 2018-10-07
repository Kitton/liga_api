defmodule LigaApiWeb.V1.SeasonLeaguePairsView do
  use LigaApiWeb, :view

  def render("index.json", %{data: data}) do
    %{season_league_pairs: data}
  end
end
