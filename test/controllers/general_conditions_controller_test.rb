require 'test_helper'

class GeneralConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_condition = general_conditions(:one)
  end

  test "should get index" do
    get general_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_general_condition_url
    assert_response :success
  end

  test "should create general_condition" do
    assert_difference('GeneralCondition.count') do
      post general_conditions_url, params: { general_condition: { art_patient_id: @general_condition.art_patient_id, date: @general_condition.date, physical_exam: @general_condition.physical_exam, pregnancy_status: @general_condition.pregnancy_status, symptom_screen: @general_condition.symptom_screen, vital_signs_anrtopometry_and_functional_level: @general_condition.vital_signs_anrtopometry_and_functional_level } }
    end

    assert_redirected_to general_condition_url(GeneralCondition.last)
  end

  test "should show general_condition" do
    get general_condition_url(@general_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_condition_url(@general_condition)
    assert_response :success
  end

  test "should update general_condition" do
    patch general_condition_url(@general_condition), params: { general_condition: { art_patient_id: @general_condition.art_patient_id, date: @general_condition.date, physical_exam: @general_condition.physical_exam, pregnancy_status: @general_condition.pregnancy_status, symptom_screen: @general_condition.symptom_screen, vital_signs_anrtopometry_and_functional_level: @general_condition.vital_signs_anrtopometry_and_functional_level } }
    assert_redirected_to general_condition_url(@general_condition)
  end

  test "should destroy general_condition" do
    assert_difference('GeneralCondition.count', -1) do
      delete general_condition_url(@general_condition)
    end

    assert_redirected_to general_conditions_url
  end
end
