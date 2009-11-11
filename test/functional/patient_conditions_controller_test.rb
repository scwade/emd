require 'test_helper'

class PatientConditionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should 1 create patient_condition" do
    assert_difference('PatientCondition.count') do
      p = PatientProfile.first.id
      c = Condition.first.id
      post :create, :patient_condition => {:patient_profile_id => p, 
                                           :condition_id => c, 
                                           :start_date => 10.days.ago, 
                                           :end_date => 1.day.ago }
    end

    assert_redirected_to patient_condition_path(assigns(:patient_condition))
  end

  test "should 2 show patient_condition" do
    get :show, :id => patient_conditions(:one).to_param
    assert_response :success
  end

  test "should 3 get edit" do
    get :edit, :id => patient_conditions(:one).to_param
    assert_response :success
  end

  test "should 4 update patient_condition" do
    put :update, :id => patient_conditions(:one).to_param, :patient_condition => { }
    assert_redirected_to patient_condition_path(assigns(:patient_condition))
  end

  test "should 5 destroy patient_condition" do
    assert_difference('PatientCondition.count', -1) do
      delete :destroy, :id => patient_conditions(:two).to_param
    end

    assert_redirected_to patient_conditions_path
  end
end
