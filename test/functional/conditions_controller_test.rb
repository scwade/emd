require 'test_helper'

class ConditionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should 1 create condition" do
    assert_difference('Condition.count') do
      post :create, :condition => {:name => "Headache" }
    end

    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should 2 show condition" do
    get :show, :id => conditions(:one).to_param
    assert_response :success
  end

  test "should 3 get edit" do
    get :edit, :id => conditions(:one).to_param
    assert_response :success
  end

  test "should 4 update condition" do
    put :update, :id => conditions(:one).to_param, :condition => { }
    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should 5 destroy condition" do
    assert_difference('Condition.count', -1) do
      delete :destroy, :id => conditions(:two).to_param
    end

    assert_redirected_to conditions_path
  end
end
