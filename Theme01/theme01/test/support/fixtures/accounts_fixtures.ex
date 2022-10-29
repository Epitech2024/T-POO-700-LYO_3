defmodule Theme01.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Theme01.Accounts` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-28 00:26:00],
        user: "some user"
      })
      |> Theme01.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-28 00:37:00]
      })
      |> Theme01.Accounts.create_clock()

    clock
  end
end
