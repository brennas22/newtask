defmodule RedoWeb.PageController do
  use RedoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
