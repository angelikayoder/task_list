require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_one, @task_two = tasks(:one, :two)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { format: :js, task: { is_done: @task_one.is_done, position: @task_one.position, title: @task_one.title } }
    end

    assert_response :success
  end

  test "should show task" do
    get task_url(@task_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task_one)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task_one), params: { format: :js, task: { is_done: @task_one.is_done, position: @task_one.position, title: @task_one.title } }
    assert_response :success
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task_one), params: { format: :html }
    end

    assert_redirected_to tasks_url
  end

  test "should mark complete" do
    patch complete_task_url(@task_one), params: { format: :js }
    assert_response :success

    @task_one.reload

    assert @task_one.is_done?
    assert_equal 2, @task_one.position
  end

  test "should sort tasks" do
    patch sort_tasks_url, params: { task: [@task_two.id.to_s, @task_one.id.to_s] }
    assert_response :success

    @task_one.reload
    @task_two.reload

    assert_equal @task_two.position, 1
    assert_equal @task_one.position, 2
  end
end
