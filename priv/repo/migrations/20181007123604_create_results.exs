defmodule LigaApi.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add(:division, :string, null: false)
      add(:season, :integer, null: false)
      add(:date, :date, null: false)
      add(:home_team, :string, null: false)
      add(:away_team, :string, null: false)
      add(:fthg, :integer, null: false)
      add(:ftag, :integer, null: false)
      add(:ftr, :string, null: false)
      add(:hthg, :integer, null: false)
      add(:htag, :integer, null: false)
      add(:htr, :string, null: false)
    end

    create(index(:results, [:division, :season]))
  end
end
