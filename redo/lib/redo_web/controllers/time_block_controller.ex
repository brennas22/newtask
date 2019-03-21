defmodule RedoWeb.Time_blockController do
  use RedoWeb, :controller

  alias Redo.Time_blocks
  alias Redo.Time_blocks.Time_block

  action_fallback RedoWeb.FallbackController

  def index(conn, _params) do
    time_blocks = Time_blocks.list_time_blocks()
    render(conn, "index.json", time_blocks: time_blocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
    with {:ok, %Time_block{} = time_block} <- Time_blocks.create_time_block(time_block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.time_block_path(conn, :show, time_block))
      |> render("show.json", time_block: time_block)
    end
  end

  def show(conn, %{"id" => id}) do
    time_block = Time_blocks.get_time_block!(id)
    render(conn, "show.json", time_block: time_block)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block = Time_blocks.get_time_block!(id)

    with {:ok, %Time_block{} = time_block} <- Time_blocks.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = Time_blocks.get_time_block!(id)

    with {:ok, %Time_block{}} <- Time_blocks.delete_time_block(time_block) do
      send_resp(conn, :no_content, "")
    end
  end
end
