defmodule RfidLatachzWeb.AttendanceController do
  use RfidLatachzWeb, :controller

  alias RfidLatachz.Attendances

  def create(conn, %{"rfid_uid" => rfid_uid}) do
    case Attendances.create_attendance(%{}, rfid_uid) do
      {:ok, _} ->
        conn
        |> put_status(:ok)
        |> json(%{message: "Attendance checked"})
      {:error, msg} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: msg})
    end
  end
end
