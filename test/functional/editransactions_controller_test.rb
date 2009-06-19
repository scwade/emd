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

  test "should create editransaction" do
    assert_difference('Editransaction.count') do
      post :create, :editransaction => { }
    end

    assert_redirected_to editransaction_path(assigns(:editransaction))
  end

  test "should show editransaction" do
    get :show, :id => editransactions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => editransactions(:one).to_param
    assert_response :success
  end

  test "should update editransaction" do
    put :update, :id => editransactions(:one).to_param, :editransaction => { }
    assert_redirected_to editransaction_path(assigns(:editransaction))
  end

  test "should destroy editransaction" do
    assert_difference('Editransaction.count', -1) do
      delete :destroy, :id => editransactions(:one).to_param
    end

    assert_redirected_to editransactions_path
  end
end
