defmodule OrientadorWeb.Live.Home.Components.Question3 do
  use OrientadorWeb, :live_component

  @impl true
  def handle_event("step:question3", %{"answer" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | question3: value}}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:question3", %{"value" => "next"}, socket) do
    send self(), {:next, :question4}
    {:noreply, socket}
  end
end