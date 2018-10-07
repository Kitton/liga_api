defmodule LigaApi.Factory do
  alias LigaApi.Repo

  alias LigaApi.Result

  def build(:result) do
    %Result{
      division: "SP1",
      season: 20172018,
      date: ~D[2018-01-01],
      home_team: "La Coruna",
      away_team: "Eibar",
      fthg: 2,
      ftag: 1,
      ftr: "H",
      hthg: 0,
      htag: 0,
      htr: "D"
    }
  end

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
