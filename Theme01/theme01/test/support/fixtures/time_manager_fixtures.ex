defmodule Theme01.TimeManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Theme01.TimeManager` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Theme01.TimeManager.create_user()

    user
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-28 00:35:00],
        start: ~N[2022-10-28 00:35:00]
      })
      |> Theme01.TimeManager.create_workingtime()

    workingtime
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-28 00:56:00]
      })
      |> Theme01.TimeManager.create_clock()

    clock
  end
end
