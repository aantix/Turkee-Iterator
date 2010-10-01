require 'test_helper'

class TurkeeTasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turkee_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turkee_task" do
    assert_difference('TurkeeTask.count') do
      post :create, :turkee_task => { }
    end

    assert_redirected_to turkee_task_path(assigns(:turkee_task))
  end

  test "should show turkee_task" do
    get :show, :id => turkee_tasks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => turkee_tasks(:one).to_param
    assert_response :success
  end

  test "should update turkee_task" do
    put :update, :id => turkee_tasks(:one).to_param, :turkee_task => { }
    assert_redirected_to turkee_task_path(assigns(:turkee_task))
  end

  test "should destroy turkee_task" do
    assert_difference('TurkeeTask.count', -1) do
      delete :destroy, :id => turkee_tasks(:one).to_param
    end

    assert_redirected_to turkee_tasks_path
  end
end
