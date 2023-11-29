defmodule OrientadorWeb.Live.Home do
  use OrientadorWeb, :live_view

  require Logger

  alias __MODULE__
  alias Orientador.Chat

  alias Home.Components
  alias Components.Welcome
  alias Components.Question1
  alias Components.Question2
  alias Components.Question3
  alias Components.Question4
  alias Components.Loading
  alias Components.Done

  @impl true
  def mount(params, _session, socket) do
    {:ok, socket
          |> assign(:step, :welcome)
          |> assign(:result, nil)
          |> assign(:answers, %{
                name: Map.get(params, "name", ""),
                email: Map.get(params, "email", ""),
                question1: "",
                question2: "",
                question3: "",
                question4: ""
              })
    }
  end

  @impl true
  def handle_info(:loading, socket) do
    answers = socket.assigns.answers

    Logger.debug(answers)

    answers
    |> Chat.recommend()
    |> then(fn result -> send self(), {:done, result} end)

    {:noreply, socket
               |> assign(:step, :loading)
    }
  end

  def handle_info({:done, result}, socket) do
    {:noreply, socket
               |> assign(:result, result)
               |> assign(:step, :done)
    }
  end

  def handle_info({:next, step}, socket) do
    {:noreply, socket
               |> assign(:step, step)
    }
  end

  def handle_info({:answers, answers}, socket) do
    {:noreply, socket
        |> assign(:answers, answers)
    }
  end
end