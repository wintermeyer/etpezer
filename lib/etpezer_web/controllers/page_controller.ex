defmodule EtpezerWeb.PageController do
  use EtpezerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
