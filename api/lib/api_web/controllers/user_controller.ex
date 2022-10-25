defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.User

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    users = TimeManager.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- TimeManager.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = TimeManager.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = TimeManager.get_user!(id)

    with {:ok, %User{} = user} <- TimeManager.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = TimeManager.get_user!(id)

    with {:ok, %User{}} <- TimeManager.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
