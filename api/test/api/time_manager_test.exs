defmodule Api.TimeManagerTest do
  use Api.DataCase

  alias Api.TimeManager

  describe "users" do
    alias Api.TimeManager.User

    import Api.TimeManagerFixtures

    @invalid_attrs %{email: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert TimeManager.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert TimeManager.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: 42, username: "some username"}

      assert {:ok, %User{} = user} = TimeManager.create_user(valid_attrs)
      assert user.email == 42
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: 43, username: "some updated username"}

      assert {:ok, %User{} = user} = TimeManager.update_user(user, update_attrs)
      assert user.email == 43
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_user(user, @invalid_attrs)
      assert user == TimeManager.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = TimeManager.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_user(user)
    end
  end

  describe "clocks" do
    alias Api.TimeManager.Clock

    import Api.TimeManagerFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert TimeManager.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert TimeManager.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~T[14:00:00]}

      assert {:ok, %Clock{} = clock} = TimeManager.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~T[14:00:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~T[15:01:01]}

      assert {:ok, %Clock{} = clock} = TimeManager.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~T[15:01:01]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_clock(clock, @invalid_attrs)
      assert clock == TimeManager.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = TimeManager.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_clock(clock)
    end
  end

  describe "workingtimes" do
    alias Api.TimeManager.Workingtime

    import Api.TimeManagerFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert TimeManager.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert TimeManager.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      valid_attrs = %{end: ~N[2022-10-24 18:38:00], start: ~N[2022-10-24 18:38:00]}

      assert {:ok, %Workingtime{} = workingtime} = TimeManager.create_workingtime(valid_attrs)
      assert workingtime.end == ~N[2022-10-24 18:38:00]
      assert workingtime.start == ~N[2022-10-24 18:38:00]
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      update_attrs = %{end: ~N[2022-10-25 18:38:00], start: ~N[2022-10-25 18:38:00]}

      assert {:ok, %Workingtime{} = workingtime} = TimeManager.update_workingtime(workingtime, update_attrs)
      assert workingtime.end == ~N[2022-10-25 18:38:00]
      assert workingtime.start == ~N[2022-10-25 18:38:00]
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == TimeManager.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = TimeManager.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_workingtime(workingtime)
    end
  end
end
