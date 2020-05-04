defmodule PusemitWeb.GameLive.AddPlayerComponent do
  use PusemitWeb, :live_component
  alias Pusemit.Games
  alias Games.Player

  @impl true
  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(:changeset, Games.change_player(%Player{}))}
  end

  @impl true
  def handle_event("save", %{"player" => %{"name" => name}}, socket) do
    case Games.create_player(%{game_id: socket.assigns.game.id, name: name}) do
      {:ok, _player} ->
        {:noreply,
         socket
         |> put_flash(:info, "Added the player")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(changeset: changeset)}
    end
  end

  @impl true
  def render(assigns) do
    ~L"""
    <%= f = form_for @changeset, "#", phx_target: @myself, phx_submit: "save" %>
        <%= label f, :name %>
        <%= text_input f, :name %>
        <%= error_tag f, :name %>
        <%= submit "Submit" %>
    </form>
    """
  end
end
