defmodule RfidLatachzWeb.UserLive.Show do
  use RfidLatachzWeb, :live_view

  alias RfidLatachz.Users
  alias RfidLatachz.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:user, Users.get_user!(id) |> Repo.preload(:attendances))}
  end

  defp page_title(:show), do: "Show User"
  defp page_title(:edit), do: "Edit User"
end
