defmodule RfidLatachz.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias RfidLatachz.Attendances.Attendance

  schema "users" do
    field :name, :string
    field :rfid_uid, :integer

    has_many(:attendances, Attendance)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :rfid_uid])
    |> validate_required([:name, :rfid_uid])
  end
end
