defmodule LigaApi.ResultTest do
  use ExUnit.Case, async: true

  alias Ecto.Adapters.SQL.Sandbox
  alias LigaApi.Result
  alias LigaApi.Factory

  @repo LigaApi.Repo

  describe "insert/1" do
    setup do
      :ok = Sandbox.checkout(@repo)
    end

    test "insert result" do
      assert Enum.empty?(@repo.all(Result))
      Factory.insert!(:result)

      assert length(@repo.all(Result)) == 1
    end
  end

  describe "list_divisions_and_seasons/0" do
    setup do
      :ok = Sandbox.checkout(@repo)
    end

    test "retrieve list of unique division and season pairs" do
      Factory.insert!(:result)
      Factory.insert!(:result)
      Factory.insert!(:result, division: "division")
      Factory.insert!(:result, season: 20_012_002, division: "division_2")

      assert ["SP1 20172018", "division 20172018", "division_2 20012002"] ==
               Enum.sort(Result.list_divisions_and_seasons())
    end

    test "retrieve 0 division and season pairs if DB is empty" do
      assert [] == Result.list_divisions_and_seasons()
    end
  end

  describe "all_by_division_and_season/1" do
    setup do
      :ok = Sandbox.checkout(@repo)
      result1 = Factory.insert!(:result)
      result2 = Factory.insert!(:result)
      Factory.insert!(:result, division: "wrong_division")
      %{result1: result1, result2: result2}
    end

    test "retrieve data succesfully", context do
      found_result =
        Result.all_by_division_and_season(%{
          division: context.result1.division,
          season: context.result1.season
        })

      assert found_result == [context.result2, context.result1]
    end

    test "retrieve nothing if it doesnt exist", context do
      found_result =
        Result.all_by_division_and_season(%{division: "not_exist", season: context.result1.season})

      assert found_result == []
    end
  end
end
