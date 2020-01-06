defmodule RfidLatachzWeb.PageController do
  use RfidLatachzWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
