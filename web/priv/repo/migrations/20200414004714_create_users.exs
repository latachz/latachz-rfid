defmodule RfidLatachz.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:rfid_uid, :integer)

      timestamps()
    end

    create(unique_index(:users, [:rfid_uid]))
  end
end
