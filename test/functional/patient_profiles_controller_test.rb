require 'test_helper'

class PatientProfilesControllerTest < ActionController::TestCase
  self.use_transactional_fixtures = true
  fixtures :patient_profiles

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should 1 create patient_profile" do
    assert_difference('PatientProfile.count') do
      post :create, :patient_profile => { :pmd_patient_id    => 1999,
                                          :pmd_user_id       => 2999,
                                          :physician_id      => 3999,
                                          :first_name        => 'Lisa',
                                          :last_name         => 'Hoyt',
                                          :state_province    => 'AB',
                                          :email             => 'lisa@proficientMD.com',
                                          :date_of_birth     => Time.at(0),
                                          :gender            => 'F',
                                          :ethnicity         => 'White'}
      end
    assert_redirected_to patient_profile_path(assigns(:patient_profile))
  end

  test "should 2 show patient_profile" do
    get :show, :id => patient_profiles(:rolland).to_param
    assert_response :success
  end

  test "should 3 get edit" do
    get :edit, :id => patient_profiles(:rolland).to_param
    assert_response :success
  end

  test "should 4 update patient_profile" do
    put :update, :id => patient_profiles(:rolland).to_param, :patient_profile => { }
    assert_redirected_to patient_profile_path(assigns(:patient_profile))
  end

  test "should 5 activate/de-activate patient_profile" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_profiles)
  end

end
