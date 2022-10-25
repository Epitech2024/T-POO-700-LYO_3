defmodule ApiWeb.PageController do
  use ApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{"test" => 3435})
    # render(conn, "index.html")
  end
end
