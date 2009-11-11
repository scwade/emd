require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  #self.use_transactional_fixtures = true
  fixtures :users

  def setup
    @request.session[:current_user] = users(:scott).id
  end

  test "should 1 get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should 2 get new" do
    get :new
    assert_response :success
  end

  test "should 3 create user" do
    assert_difference('User.count') do
      post :create, :user => { :username => "apple",
                               :email => "apple@yahoo.com",
                               :password => 123456,
                               :password_confirmation => 123456
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should 4 show user" do
    get :show, :id => users(:scott).to_param
    assert_response :success
  end

   puts "\n ********** \n User controller action: Edit test not implemented yet"
#  test "should 5 get edit" do
#    get :edit, :id => users(:scott).to_param 
#    assert_response :success
#  end

   puts " User controller action: Update test not implemented yet \n ********** \n "
#  test "should 6 update user" do
#    put :update, :id => users(:scott).to_param 
#    assert_redirected_to user_path(assigns(:user))
#  end

  test "should 7 destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:scott).to_param
    end

    assert_redirected_to users_path
  end
end
