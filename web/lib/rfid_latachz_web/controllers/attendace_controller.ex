defmodule RfidLatachzWeb.AttendanceController do
  use RfidLatachzWeb, :controller

  alias RfidLatachz.Attendances

  def create(conn, %{"rfid_uid" => rfid_uid}) do
    Attendances.create_attendance(%{}, rfid_uid)
    conn
    |> put_status(:ok)
    |> json(%{message: "Attendance checked"})
  end
end
