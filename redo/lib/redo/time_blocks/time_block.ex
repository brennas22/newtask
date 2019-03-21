defmodule Redo.Time_blocks.Time_block do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_blocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :task, Redo.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(time_block, attrs) do
    time_block
    |> cast(attrs, [:start, :end, :task_id])
    |> validate_required([:start, :end, :task_id])
  end
end
