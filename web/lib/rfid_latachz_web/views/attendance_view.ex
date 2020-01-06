defmodule RfidLatachzWeb.AttendanceView do
  use RfidLatachzWeb, :view

  alias RfidLatachz.Users

  def user(user_id) do
    user = Users.get_user!(user_id)

    %{name: user.name, rfid_uid: user.rfid_uid}
  end
end
