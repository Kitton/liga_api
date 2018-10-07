defmodule LigaApi.DataLoader do
  @moduledoc false

  alias LigaApi.Repo
  alias LigaApi.Result

  @initial_data_file "Data.csv"

  def run do
    "#{File.cwd!()}/#{@initial_data_file}"
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.each(fn result ->
      %Result{
        division: Map.fetch!(result, "Div"),
        season: result |> Map.fetch!("Season") |> String.to_integer(),
        date: result |> Map.fetch!("Date") |> parse_date(),
        home_team: Map.fetch!(result, "HomeTeam"),
        away_team: Map.fetch!(result, "AwayTeam"),
        fthg: result |> Map.fetch!("FTHG") |> String.to_integer(),
        ftag: result |> Map.fetch!("HTAG") |> String.to_integer(),
        ftr: Map.fetch!(result, "FTR"),
        hthg: result |> Map.fetch!("HTHG") |> String.to_integer(),
        htag: result |> Map.fetch!("HTAG") |> String.to_integer(),
        htr: Map.fetch!(result, "HTR")
      }
      |> Repo.insert!()
    end)
  end

  defp parse_date(date_string) do
    [d, m, y] = String.split(date_string, "/") |> Enum.map(fn x -> String.to_integer(x) end)
    {:ok, date} = Date.new(y, m, d)
    date
  end
end
