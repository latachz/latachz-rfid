defmodule RfidLatachz.Attendances.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendances" do
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [])
    |> validate_required([])
  end
end
