require "application_system_test_case"

class UserTasksTest < ApplicationSystemTestCase
  setup do
    @user_task = user_tasks(:one)
  end

  test "visiting the index" do
    visit user_tasks_url
    assert_selector "h1", text: "User tasks"
  end

  test "should create user task" do
    visit user_tasks_url
    click_on "New user task"

    fill_in "Deleted at", with: @user_task.deleted_at
    fill_in "Due date", with: @user_task.due_date
    fill_in "End time", with: @user_task.end_time
    fill_in "Remarks", with: @user_task.remarks
    fill_in "Start time", with: @user_task.start_time
    fill_in "Status", with: @user_task.status_id
    fill_in "Task", with: @user_task.task_id
    fill_in "User", with: @user_task.user_id
    click_on "Create User task"

    assert_text "User task was successfully created"
    click_on "Back"
  end

  test "should update User task" do
    visit user_task_url(@user_task)
    click_on "Edit this user task", match: :first

    fill_in "Deleted at", with: @user_task.deleted_at
    fill_in "Due date", with: @user_task.due_date
    fill_in "End time", with: @user_task.end_time
    fill_in "Remarks", with: @user_task.remarks
    fill_in "Start time", with: @user_task.start_time
    fill_in "Status", with: @user_task.status_id
    fill_in "Task", with: @user_task.task_id
    fill_in "User", with: @user_task.user_id
    click_on "Update User task"

    assert_text "User task was successfully updated"
    click_on "Back"
  end

  test "should destroy User task" do
    visit user_task_url(@user_task)
    click_on "Destroy this user task", match: :first

    assert_text "User task was successfully destroyed"
  end
end
