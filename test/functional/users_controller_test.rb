require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should 1 create user" do
    assert_difference('User.count') do
      post :create, :user => { :name => "apple",
                               :hashed_password => "ddda00bebd1c0e44a1699f8cefd5bb8942d162c8",
                               :salt => "-6114114380.824929958769304"
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should 2 show user" do
    get :show, :id => users(:scott).to_param
    assert_response :success
  end

  test "should 3 get edit" do
    get :edit, :id => users(:scott).to_param
    assert_response :success
  end

  test "should 4 update user" do
    put :update, :id => users(:scott).to_param, :user => { }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should 5 destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:scott).to_param
    end

    assert_redirected_to users_path
  end
end
