defmodule Redo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :name, :string
    belongs_to :user, Redo.Users.User
    has_many :timeblocks, Redo.Time_blocks.Time_block

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :complete, :user_id])
    |> validate_required([:name, :desc])
  end
end
