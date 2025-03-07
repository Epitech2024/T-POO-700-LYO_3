defmodule ApiWeb.ClockController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.Clock

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    clocks = TimeManager.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- TimeManager.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = TimeManager.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = TimeManager.get_clock!(id)

    with {:ok, %Clock{} = clock} <- TimeManager.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = TimeManager.get_clock!(id)

    with {:ok, %Clock{}} <- TimeManager.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
