defmodule OrientadorWeb.Live.Home.Components.Question1 do
  use OrientadorWeb, :live_component

  @impl true
  def handle_event("step:question1", %{"answer" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | question1: value}}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:question1", %{"value" => "next"}, socket) do
    send self(), {:next, :question2}
    {:noreply, socket}
  end
end