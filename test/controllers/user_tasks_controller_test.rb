require "test_helper"

class UserTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_task = user_tasks(:one)
  end

  test "should get index" do
    get user_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_user_task_url
    assert_response :success
  end

  test "should create user_task" do
    assert_difference("UserTask.count") do
      post user_tasks_url, params: { user_task: { deleted_at: @user_task.deleted_at, due_date: @user_task.due_date, end_time: @user_task.end_time, remarks: @user_task.remarks, start_time: @user_task.start_time, status_id: @user_task.status_id, task_id: @user_task.task_id, user_id: @user_task.user_id } }
    end

    assert_redirected_to user_task_url(UserTask.last)
  end

  test "should show user_task" do
    get user_task_url(@user_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_task_url(@user_task)
    assert_response :success
  end

  test "should update user_task" do
    patch user_task_url(@user_task), params: { user_task: { deleted_at: @user_task.deleted_at, due_date: @user_task.due_date, end_time: @user_task.end_time, remarks: @user_task.remarks, start_time: @user_task.start_time, status_id: @user_task.status_id, task_id: @user_task.task_id, user_id: @user_task.user_id } }
    assert_redirected_to user_task_url(@user_task)
  end

  test "should destroy user_task" do
    assert_difference("UserTask.count", -1) do
      delete user_task_url(@user_task)
    end

    assert_redirected_to user_tasks_url
  end
end
