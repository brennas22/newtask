defmodule RedoWeb.Time_blockView do
  use RedoWeb, :view
  alias RedoWeb.Time_blockView

  def render("index.json", %{time_blocks: time_blocks}) do
    %{data: render_many(time_blocks, Time_blockView, "time_block.json")}
  end

  def render("show.json", %{time_block: time_block}) do
    %{data: render_one(time_block, Time_blockView, "time_block.json")}
  end

  def render("time_block.json", %{time_block: time_block}) do
    %{id: time_block.id,
      start: time_block.start,
      end: time_block.end}
  end
end
