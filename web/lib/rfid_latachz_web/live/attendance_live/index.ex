defmodule RfidLatachzWeb.AttendanceLive.Index do
  use RfidLatachzWeb, :live_view

  alias RfidLatachz.Attendances

  alias RfidLatachz.Repo

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Attendances.subscribe()
    {:ok, assign(socket, :attendances, list_attendances())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Attendances")
    |> assign(:attendance, nil)
  end

  @impl true
  def handle_info({:attendance_created, attendance}, socket) do
    {:noreply, update(socket, :attendances, fn attendances -> [attendance |> Repo.preload(:user) | attendances] end)}
  end

  defp list_attendances do
    Attendances.list_attendances()
  end
end
