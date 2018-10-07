defmodule LigaApi.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add(:division, :string)
      add(:season, :integer)
      add(:date, :date)
      add(:home_team, :string)
      add(:away_team, :string)
      add(:fthg, :integer)
      add(:ftag, :integer)
      add(:ftr, :string)
      add(:hthg, :integer)
      add(:htag, :integer)
      add(:htr, :string)
    end

    create(index(:results, [:division, :season]))
  end
end
