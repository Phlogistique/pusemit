defmodule PusemitWeb.GameLive.AddWordComponent do
  use PusemitWeb, :live_component
  alias Pusemit.Games
  alias Games.Word

  @impl true
  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(:changeset, Games.change_word(%Word{}))}
  end

  @impl true
  def handle_event("save", %{"word" => %{"spelling" => spelling}}, socket) do
    case Games.create_word(%{game_id: socket.assigns.game.id, spelling: spelling}) do
      {:ok, _word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Added the word")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(changeset: changeset)}
    end
  end

  @impl true
  def render(assigns) do
    ~L"""
    <%= f = form_for @changeset, "#", phx_target: @myself, phx_submit: "save" %>
        <%= label f, :spelling %>
        <%= text_input f, :spelling %>
        <%= error_tag f, :spelling %>
        <%= submit "Submit" %>
    </form>
    """
  end
end
