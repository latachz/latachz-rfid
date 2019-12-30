defmodule RfidLatachz.Repo do
  use Ecto.Repo,
    otp_app: :rfid_latachz,
    adapter: Ecto.Adapters.Postgres
end
