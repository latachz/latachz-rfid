defmodule RfidLatachz.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(index(:attendances, [:user_id]))
  end
end
