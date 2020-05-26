defmodule RfidLatachz.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :rfid_uid, :integer

      timestamps()
    end

  end
end
