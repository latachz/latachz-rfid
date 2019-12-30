defmodule RfidLatachz.Attendances do
  @moduledoc """
  The Attendances context.
  """

  import Ecto.Query, warn: false
  alias RfidLatachz.Repo

  alias RfidLatachz.Attendances.Attendance
  alias RfidLatachz.Users

  @doc """
  Returns the list of attendances.

  ## Examples

      iex> list_attendances()
      [%Attendance{}, ...]

  """
  def list_attendances do
    Repo.all(Attendance)
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
  def get_attendance!(id) do
    Attendance
    |> Repo.get(id)
  end

  @doc """
  Creates a attendance.

  ## Examples

      iex> create_attendance(%{field: value})
      {:ok, %Attendance{}}

      iex> create_attendance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attendance(attrs \\ %{}) do
    %Attendance{}
    |> Attendance.changeset(attrs)
    |> Repo.insert()
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
  Deletes a Attendance.

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
      %Ecto.Changeset{source: %Attendance{}}

  """
  def change_attendance(%Attendance{} = attendance) do
    Attendance.changeset(attendance, %{})
  end

  def list_user_attendances(%Users.User{} = user) do
    Attendance
    |> user_attendances_query(user)
    |> Repo.all()
  end

  def get_user_attendance!(%Users.User{} = user) do
    Attendance
    |> user_attendances_query(user)
    |> Repo.one!()
  end

  defp user_attendances_query(query, %Users.User{id: user_id}) do
    from(a in query, where: a.user_id == ^user_id)
  end

  def attendances() do
    query = from a in Attendance,
     select: a.inserted_at,
     where: a.user_id == ^2
    Repo.all(query)
  end

end
