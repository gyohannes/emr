require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { MRN: @patient.MRN, date_of_birth: @patient.date_of_birth, education_level: @patient.education_level, father_name: @patient.father_name, first_name: @patient.first_name, gender: @patient.gender, grand_father_name: @patient.grand_father_name, home_telephone: @patient.home_telephone, house_number: @patient.house_number, kebele: @patient.kebele, marital_status: @patient.marital_status, mobile_phone: @patient.mobile_phone, mother_first_name: @patient.mother_first_name, occupation: @patient.occupation, organization_structure_id: @patient.organization_structure_id, religion: @patient.religion } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { MRN: @patient.MRN, date_of_birth: @patient.date_of_birth, education_level: @patient.education_level, father_name: @patient.father_name, first_name: @patient.first_name, gender: @patient.gender, grand_father_name: @patient.grand_father_name, home_telephone: @patient.home_telephone, house_number: @patient.house_number, kebele: @patient.kebele, marital_status: @patient.marital_status, mobile_phone: @patient.mobile_phone, mother_first_name: @patient.mother_first_name, occupation: @patient.occupation, organization_structure_id: @patient.organization_structure_id, religion: @patient.religion } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
