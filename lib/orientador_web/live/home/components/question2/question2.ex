defmodule OrientadorWeb.Live.Home.Components.Question2 do
  use OrientadorWeb, :live_component

  @impl true
  def handle_event("step:question2", %{"answer" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | question2: value}}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:question2", %{"value" => "next"}, socket) do
    send self(), {:next, :question3}
    {:noreply, socket}
  end
end