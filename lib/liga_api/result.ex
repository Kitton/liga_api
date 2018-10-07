defmodule LigaApi.Result do
  @moduledoc false

  alias __MODULE__
  use Ecto.Schema
  alias Ecto.Changeset
  import Ecto.Query

  @type division :: String.t()
  @type season :: pos_integer

  @type t :: %Result{
          id: pos_integer | nil,
          division: division,
          season: season,
          date: Date.t(),
          home_team: String.t(),
          away_team: String.t(),
          fthg: non_neg_integer,
          ftag: non_neg_integer,
          ftr: String.t(),
          hthg: non_neg_integer,
          htag: non_neg_integer,
          htr: String.t()
        }

  @fields ~w(id division season date home_team away_team fthg ftag ftr hthg htag htr)a

  schema "results" do
    field(:division, :string)
    field(:season, :integer)
    field(:date, :date)
    field(:home_team, :string)
    field(:away_team, :string)
    field(:fthg, :integer)
    field(:ftag, :integer)
    field(:ftr, :string)
    field(:hthg, :integer)
    field(:htag, :integer)
    field(:htr, :string)
  end

  @spec changeset(map) :: Changeset.t()
  def changeset(params) do
    %Result{}
    |> Changeset.cast(params, @fields)
    |> Changeset.validate_required(@fields)
  end

  @spec all_by_division_and_season(%{division: division, season: season}) :: [Result.t()] | []
  def all_by_division_and_season(%{division: division, season: season}) do
    query =
      from(r in Result,
        where: r.division == ^division and r.season == ^season,
        select: r
      )

    LigaApi.Repo.all(query)
  end

  @spec list_divisions_and_seasons() :: [String.t()] | []
  def list_divisions_and_seasons do
    query =
      from(r in Result,
        distinct: true,
        select: [r.division, r.season]
      )

    query |> LigaApi.Repo.all() |> Enum.map(fn x -> Enum.join(x, " ") end)
  end
end
