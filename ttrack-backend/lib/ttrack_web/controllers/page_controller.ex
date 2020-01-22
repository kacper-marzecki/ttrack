defmodule TtrackWeb.PageController do
  use TtrackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
