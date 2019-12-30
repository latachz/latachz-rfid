defmodule RfidLatachzWeb.AttendanceControllerTest do
  use RfidLatachzWeb.ConnCase

  alias RfidLatachz.Attendances

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:attendance) do
    {:ok, attendance} = Attendances.create_attendance(@create_attrs)
    attendance
  end

  describe "index" do
    test "lists all attendances", %{conn: conn} do
      conn = get(conn, Routes.attendance_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Attendances"
    end
  end

  describe "new attendance" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.attendance_path(conn, :new))
      assert html_response(conn, 200) =~ "New Attendance"
    end
  end

  describe "create attendance" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.attendance_path(conn, :create), attendance: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.attendance_path(conn, :show, id)

      conn = get(conn, Routes.attendance_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Attendance"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.attendance_path(conn, :create), attendance: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Attendance"
    end
  end

  describe "edit attendance" do
    setup [:create_attendance]

    test "renders form for editing chosen attendance", %{conn: conn, attendance: attendance} do
      conn = get(conn, Routes.attendance_path(conn, :edit, attendance))
      assert html_response(conn, 200) =~ "Edit Attendance"
    end
  end

  describe "update attendance" do
    setup [:create_attendance]

    test "redirects when data is valid", %{conn: conn, attendance: attendance} do
      conn = put(conn, Routes.attendance_path(conn, :update, attendance), attendance: @update_attrs)
      assert redirected_to(conn) == Routes.attendance_path(conn, :show, attendance)

      conn = get(conn, Routes.attendance_path(conn, :show, attendance))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, attendance: attendance} do
      conn = put(conn, Routes.attendance_path(conn, :update, attendance), attendance: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Attendance"
    end
  end

  describe "delete attendance" do
    setup [:create_attendance]

    test "deletes chosen attendance", %{conn: conn, attendance: attendance} do
      conn = delete(conn, Routes.attendance_path(conn, :delete, attendance))
      assert redirected_to(conn) == Routes.attendance_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.attendance_path(conn, :show, attendance))
      end
    end
  end

  defp create_attendance(_) do
    attendance = fixture(:attendance)
    {:ok, attendance: attendance}
  end
end
