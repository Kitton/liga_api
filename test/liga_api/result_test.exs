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


end