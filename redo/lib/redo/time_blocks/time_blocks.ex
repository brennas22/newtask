defmodule Redo.Time_blocks do
  @moduledoc """
  The Time_blocks context.
  """

  import Ecto.Query, warn: false
  alias Redo.Repo

  alias Redo.Time_blocks.Time_block

  @doc """
  Returns the list of time_blocks.

  ## Examples

      iex> list_time_blocks()
      [%Time_block{}, ...]

  """
  def list_time_blocks do
    Repo.all(Time_block)
  end

  @doc """
  Gets a single time_block.

  Raises `Ecto.NoResultsError` if the Time block does not exist.

  ## Examples

      iex> get_time_block!(123)
      %Time_block{}

      iex> get_time_block!(456)
      ** (Ecto.NoResultsError)

  """
  def get_time_block!(id), do: Repo.get!(Time_block, id)

  @doc """
  Creates a time_block.

  ## Examples

      iex> create_time_block(%{field: value})
      {:ok, %Time_block{}}

      iex> create_time_block(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_time_block(attrs \\ %{}) do
    %Time_block{}
    |> Time_block.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a time_block.

  ## Examples

      iex> update_time_block(time_block, %{field: new_value})
      {:ok, %Time_block{}}

      iex> update_time_block(time_block, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_time_block(%Time_block{} = time_block, attrs) do
    time_block
    |> Time_block.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Time_block.

  ## Examples

      iex> delete_time_block(time_block)
      {:ok, %Time_block{}}

      iex> delete_time_block(time_block)
      {:error, %Ecto.Changeset{}}

  """
  def delete_time_block(%Time_block{} = time_block) do
    Repo.delete(time_block)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking time_block changes.

  ## Examples

      iex> change_time_block(time_block)
      %Ecto.Changeset{source: %Time_block{}}

  """
  def change_time_block(%Time_block{} = time_block) do
    Time_block.changeset(time_block, %{})
  end
end
