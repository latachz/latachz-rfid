defmodule RfidLatachz.Attendances.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  alias RfidLatachz.Users

  schema "attendances" do
    belongs_to(:user, Users.User)

    timestamps()
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [])
    |> validate_required([])
  end
end
