require 'test_helper'

class ArtPatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @art_patient = art_patients(:one)
  end

  test "should get index" do
    get art_patients_url
    assert_response :success
  end

  test "should get new" do
    get new_art_patient_url
    assert_response :success
  end

  test "should create art_patient" do
    assert_difference('ArtPatient.count') do
      post art_patients_url, params: { art_patient: { care_giver_marital_status: @art_patient.care_giver_marital_status, enrollment_date: @art_patient.enrollment_date, mode_of_delivery: @art_patient.mode_of_delivery, mother_full_name: @art_patient.mother_full_name, patient_id: @art_patient.patient_id, place_of_delivery: @art_patient.place_of_delivery, target_population_category: @art_patient.target_population_category, unique_art_number: @art_patient.unique_art_number } }
    end

    assert_redirected_to art_patient_url(ArtPatient.last)
  end

  test "should show art_patient" do
    get art_patient_url(@art_patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_art_patient_url(@art_patient)
    assert_response :success
  end

  test "should update art_patient" do
    patch art_patient_url(@art_patient), params: { art_patient: { care_giver_marital_status: @art_patient.care_giver_marital_status, enrollment_date: @art_patient.enrollment_date, mode_of_delivery: @art_patient.mode_of_delivery, mother_full_name: @art_patient.mother_full_name, patient_id: @art_patient.patient_id, place_of_delivery: @art_patient.place_of_delivery, target_population_category: @art_patient.target_population_category, unique_art_number: @art_patient.unique_art_number } }
    assert_redirected_to art_patient_url(@art_patient)
  end

  test "should destroy art_patient" do
    assert_difference('ArtPatient.count', -1) do
      delete art_patient_url(@art_patient)
    end

    assert_redirected_to art_patients_url
  end
end
