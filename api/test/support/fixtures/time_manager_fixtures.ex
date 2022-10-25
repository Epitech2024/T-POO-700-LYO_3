defmodule Api.TimeManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.TimeManager` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: 42,
        username: "some username"
      })
      |> Api.TimeManager.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~T[14:00:00]
      })
      |> Api.TimeManager.create_clock()

    clock
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-24 18:38:00],
        start: ~N[2022-10-24 18:38:00]
      })
      |> Api.TimeManager.create_workingtime()

    workingtime
  end
end
