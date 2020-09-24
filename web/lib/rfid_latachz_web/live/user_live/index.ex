defmodule RfidLatachzWeb.UserLive.Index do
  use RfidLatachzWeb, :live_view

  alias RfidLatachz.Users
  alias RfidLatachz.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :users, list_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:user, nil)
  end

  @impl true
  def handle_info({:user_created, user}, socket) do
    {:noreply, update(socket, :users, fn users -> [user |> Repo.preload(:attendances) | users] end)}
  end

  defp list_users do
    Users.list_users() |> Repo.preload(:attendances)
  end
end
