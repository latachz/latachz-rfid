defmodule RfidLatachzWeb.AttendanceController do
  use RfidLatachzWeb, :controller

  alias RfidLatachz.Attendances
  alias RfidLatachz.Attendances.Attendance

  def index(conn, _params) do
    attendances = Attendances.list_attendances()
    render(conn, "index.html", attendances: attendances)
  end

  def new(conn, _params) do
    changeset = Attendances.change_attendance(%Attendance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"attendance" => attendance_params}) do
    case Attendances.create_attendance(attendance_params) do
      {:ok, attendance} ->
        conn
        |> put_flash(:info, "Attendance created successfully.")
        |> redirect(to: Routes.attendance_path(conn, :show, attendance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance = Attendances.get_attendance!(id)
    render(conn, "show.html", attendance: attendance)
  end

  def edit(conn, %{"id" => id}) do
    attendance = Attendances.get_attendance!(id)
    changeset = Attendances.change_attendance(attendance)
    render(conn, "edit.html", attendance: attendance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "attendance" => attendance_params}) do
    attendance = Attendances.get_attendance!(id)

    case Attendances.update_attendance(attendance, attendance_params) do
      {:ok, attendance} ->
        conn
        |> put_flash(:info, "Attendance updated successfully.")
        |> redirect(to: Routes.attendance_path(conn, :show, attendance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", attendance: attendance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance = Attendances.get_attendance!(id)
    {:ok, _attendance} = Attendances.delete_attendance(attendance)

    conn
    |> put_flash(:info, "Attendance deleted successfully.")
    |> redirect(to: Routes.attendance_path(conn, :index))
  end
end
