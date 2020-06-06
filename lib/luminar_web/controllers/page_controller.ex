defmodule LuminarWeb.PageController do
  use LuminarWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
