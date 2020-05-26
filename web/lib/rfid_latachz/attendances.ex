defmodule RfidLatachz.Attendances do
  @moduledoc """
  The Attendances context.
  """

  import Ecto.Query, warn: false
  alias RfidLatachz.Repo

  alias RfidLatachz.Attendances.Attendance
  alias RfidLatachz.Users

  alias Phoenix.PubSub

  import Ecto

  @doc """
  Returns the list of attendances.

  ## Examples

      iex> list_attendances()
      [%Attendance{}, ...]

  """
  def list_attendances do
    Repo.all(Attendance) |> Repo.preload(:user)
  end

  @doc """
  Gets a single attendance.

  Raises `Ecto.NoResultsError` if the Attendance does not exist.

  ## Examples

      iex> get_attendance!(123)
      %Attendance{}

      iex> get_attendance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attendance!(id), do: Repo.get!(Attendance, id)

  @doc """
  Creates a attendance.

  ## Examples

      iex> create_attendance(%{field: value})
      {:ok, %Attendance{}}

      iex> create_attendance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attendance(attrs \\ %{}, rfid_uid) do
    user = Users.get_user_by_rfid_uid(rfid_uid)

    user
    |> build_assoc(:attendances)
    |> Attendance.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:attendance_created)
  end

  @doc """
  Updates a attendance.

  ## Examples

      iex> update_attendance(attendance, %{field: new_value})
      {:ok, %Attendance{}}

      iex> update_attendance(attendance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attendance(%Attendance{} = attendance, attrs) do
    attendance
    |> Attendance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a attendance.

  ## Examples

      iex> delete_attendance(attendance)
      {:ok, %Attendance{}}

      iex> delete_attendance(attendance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attendance(%Attendance{} = attendance) do
    Repo.delete(attendance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attendance changes.

  ## Examples

      iex> change_attendance(attendance)
      %Ecto.Changeset{data: %Attendance{}}

  """
  def change_attendance(%Attendance{} = attendance, attrs \\ %{}) do
    Attendance.changeset(attendance, attrs)
  end

  def subscribe do
    PubSub.subscribe(RfidLatachz.PubSub, "attendances")
  end

  defp broadcast({:error, _} = error, _event), do: error
  defp broadcast({:ok, attendance}, event) do
    PubSub.broadcast(RfidLatachz.PubSub, "attendances", {event, attendance})
  end
end
