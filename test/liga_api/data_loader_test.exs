defmodule LigaApi.DataLoaderTest do
  use ExUnit.Case, async: true

  alias Ecto.Adapters.SQL.Sandbox
  alias LigaApi.Result
  alias LigaApi.DataLoader

  @repo LigaApi.Repo

  describe "run/0" do
    setup do
      :ok = Sandbox.checkout(@repo)
    end

    test "insert results from csv file" do
      assert Enum.empty?(@repo.all(Result))
      DataLoader.run()
      assert length(@repo.all(Result)) > 0
    end
  end
end
