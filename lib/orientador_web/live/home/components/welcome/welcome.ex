defmodule OrientadorWeb.Live.Home.Components.Welcome do
  use OrientadorWeb, :live_component

  @impl true
  def handle_event("step:welcome", %{"value" => "next"}, socket) do
    send self(), {:next, :question1}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:welcome", %{"name" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | name: value}}
    {:noreply, socket}
  end

  @impl true
  def handle_event("step:welcome", %{"email" => value}, socket) do
    send self(), {:answers, %{socket.assigns.answers | email: value}}
    {:noreply, socket}
  end

end