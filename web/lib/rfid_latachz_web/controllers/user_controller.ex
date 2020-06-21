defmodule RfidLatachzWeb.UserController do
  use RfidLatachzWeb, :controller

  alias RfidLatachz.Users

  def create(conn, %{"user" => user_params}) do
    Users.create_user(user_params)

    conn
    |> put_status(:ok)
    |> json(%{message: "User created"})
  end
end
