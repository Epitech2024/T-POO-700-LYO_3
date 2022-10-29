defmodule Theme01.AccountsTest do
  use Theme01.DataCase

  alias Theme01.Accounts

  describe "clocks" do
    alias Theme01.Accounts.Clock

    import Theme01.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil, user: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~N[2022-10-28 00:26:00], user: "some user"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2022-10-28 00:26:00]
      assert clock.user == "some user"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-29 00:26:00], user: "some updated user"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2022-10-29 00:26:00]
      assert clock.user == "some updated user"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Theme01.Accounts.Clock

    import Theme01.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~N[2022-10-28 00:37:00]}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2022-10-28 00:37:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-29 00:37:00]}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2022-10-29 00:37:00]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end
end
