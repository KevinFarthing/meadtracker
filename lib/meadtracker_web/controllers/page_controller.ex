defmodule MeadtrackerWeb.PageController do
  use MeadtrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
