defmodule LigaApi.Result do
  @moduledoc false

  alias __MODULE__
  use Ecto.Schema
  alias Ecto.Changeset

  @type t :: %Result{
          id: pos_integer,
          division: String.t(),
          season: pos_integer,
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
  @impl true
  def changeset(params) do
    %Result{}
    |> Changeset.cast(params, @fields)
    |> Changeset.validate_required(@fields)
  end
end
