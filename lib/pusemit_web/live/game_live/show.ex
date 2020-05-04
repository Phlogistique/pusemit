defmodule PusemitWeb.GameLive.Show do
  use PusemitWeb, :live_view

  alias Pusemit.Games

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:game, Games.get_game!(id))}
  end

  defp page_title(:show), do: "Show Game"
  defp page_title(:edit), do: "Edit Game"
  defp page_title(:add_player), do: "Add player"
  defp page_title(:add_word), do: "Add word"
end
