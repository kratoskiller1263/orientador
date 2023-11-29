defmodule OrientadorWeb.Live.Home.Components.Question4 do
  use OrientadorWeb, :live_component

  @impl true
  def handle_event("step:question4", %{"answer" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | question4: value}}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:question4", %{"value" => "next"}, socket) do
    send self(), {:next, :loading}
    send self(), :loading
    {:noreply, socket}
  end
end