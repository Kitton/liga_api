defmodule LigaApiWeb.V1.SeasonLeaguePairsController do
  @moduledoc false
  use LigaApiWeb, :controller

  alias LigaApi.Result

  def index(conn, _params) do
    available_pairs = Result.list_divisions_and_seasons()
    case available_pairs do
      [] -> render(put_status(conn, 404), "index.json", %{data: available_pairs})
      _ -> render(conn, "index.json", %{data: available_pairs})
    end

  end
end
