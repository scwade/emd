require 'test_helper'

class EditransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editransactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should 1 create editransaction" do
    assert_difference('Editransaction.count') do
      post :create, :editransaction => {:isa01 => 11, :isa02 => 1234567890 }
    end

    assert_redirected_to editransaction_path(assigns(:editransaction))
  end

  test "should 2 show editransaction" do
    get :show, :id => editransactions(:aetnacase1).to_param
    assert_response :success
  end

  test "should 3 get edit" do
    get :edit, :id => editransactions(:aetnacase1).to_param
    assert_response :success
  end

  test "should 4 update editransaction" do
    put :update, :id => editransactions(:aetnacase1).to_param, :editransaction => { }
    assert_redirected_to editransaction_path(assigns(:editransaction))
  end

  test "should 5 destroy editransaction" do
    assert_difference('Editransaction.count', -1) do
      delete :destroy, :id => editransactions(:aetnacase2).to_param
    end

    assert_redirected_to editransactions_path
  end
end
