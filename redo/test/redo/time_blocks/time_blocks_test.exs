defmodule Redo.Time_blocksTest do
  use Redo.DataCase

  alias Redo.Time_blocks

  describe "time_blocks" do
    alias Redo.Time_blocks.Time_block

    @valid_attrs %{end: ~N[2010-04-17 14:00:00], start: ~N[2010-04-17 14:00:00]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01], start: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{end: nil, start: nil}

    def time_block_fixture(attrs \\ %{}) do
      {:ok, time_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Time_blocks.create_time_block()

      time_block
    end

    test "list_time_blocks/0 returns all time_blocks" do
      time_block = time_block_fixture()
      assert Time_blocks.list_time_blocks() == [time_block]
    end

    test "get_time_block!/1 returns the time_block with given id" do
      time_block = time_block_fixture()
      assert Time_blocks.get_time_block!(time_block.id) == time_block
    end

    test "create_time_block/1 with valid data creates a time_block" do
      assert {:ok, %Time_block{} = time_block} = Time_blocks.create_time_block(@valid_attrs)
      assert time_block.end == ~N[2010-04-17 14:00:00]
      assert time_block.start == ~N[2010-04-17 14:00:00]
    end

    test "create_time_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Time_blocks.create_time_block(@invalid_attrs)
    end

    test "update_time_block/2 with valid data updates the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %Time_block{} = time_block} = Time_blocks.update_time_block(time_block, @update_attrs)
      assert time_block.end == ~N[2011-05-18 15:01:01]
      assert time_block.start == ~N[2011-05-18 15:01:01]
    end

    test "update_time_block/2 with invalid data returns error changeset" do
      time_block = time_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Time_blocks.update_time_block(time_block, @invalid_attrs)
      assert time_block == Time_blocks.get_time_block!(time_block.id)
    end

    test "delete_time_block/1 deletes the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %Time_block{}} = Time_blocks.delete_time_block(time_block)
      assert_raise Ecto.NoResultsError, fn -> Time_blocks.get_time_block!(time_block.id) end
    end

    test "change_time_block/1 returns a time_block changeset" do
      time_block = time_block_fixture()
      assert %Ecto.Changeset{} = Time_blocks.change_time_block(time_block)
    end
  end
end
