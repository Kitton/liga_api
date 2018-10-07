defmodule LigaApi.ResultTest do
  use ExUnit.Case, async: true

  alias Ecto.Adapters.SQL.Sandbox
  alias LigaApi.Result
  alias LigaApi.Factory

  @repo LigaApi.Repo

  describe "insert/1" do
    setup do
      :ok = Sandbox.checkout(@repo)
      %{}
    end

    test "inserts result" do
      assert Enum.empty?(@repo.all(Result))
      Factory.insert!(:result)

      assert length(@repo.all(Result)) == 1
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
