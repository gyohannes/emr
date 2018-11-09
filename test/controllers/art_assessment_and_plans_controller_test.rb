require 'test_helper'

class ArtAssessmentAndPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @art_assessment_and_plan = art_assessment_and_plans(:one)
  end

  test "should get index" do
    get art_assessment_and_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_art_assessment_and_plan_url
    assert_response :success
  end

  test "should create art_assessment_and_plan" do
    assert_difference('ArtAssessmentAndPlan.count') do
      post art_assessment_and_plans_url, params: { art_assessment_and_plan: { ARV_eleigibility_criteria: @art_assessment_and_plan.ARV_eleigibility_criteria, art_patient_id: @art_assessment_and_plan.art_patient_id, date: @art_assessment_and_plan.date, plan: @art_assessment_and_plan.plan } }
    end

    assert_redirected_to art_assessment_and_plan_url(ArtAssessmentAndPlan.last)
  end

  test "should show art_assessment_and_plan" do
    get art_assessment_and_plan_url(@art_assessment_and_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_art_assessment_and_plan_url(@art_assessment_and_plan)
    assert_response :success
  end

  test "should update art_assessment_and_plan" do
    patch art_assessment_and_plan_url(@art_assessment_and_plan), params: { art_assessment_and_plan: { ARV_eleigibility_criteria: @art_assessment_and_plan.ARV_eleigibility_criteria, art_patient_id: @art_assessment_and_plan.art_patient_id, date: @art_assessment_and_plan.date, plan: @art_assessment_and_plan.plan } }
    assert_redirected_to art_assessment_and_plan_url(@art_assessment_and_plan)
  end

  test "should destroy art_assessment_and_plan" do
    assert_difference('ArtAssessmentAndPlan.count', -1) do
      delete art_assessment_and_plan_url(@art_assessment_and_plan)
    end

    assert_redirected_to art_assessment_and_plans_url
  end
end
