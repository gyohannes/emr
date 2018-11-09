require 'test_helper'

class SocialAssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_assessment = social_assessments(:one)
  end

  test "should get index" do
    get social_assessments_url
    assert_response :success
  end

  test "should get new" do
    get new_social_assessment_url
    assert_response :success
  end

  test "should create social_assessment" do
    assert_difference('SocialAssessment.count') do
      post social_assessments_url, params: { social_assessment: { art_patient_id: @social_assessment.art_patient_id, date: @social_assessment.date, disclosure: @social_assessment.disclosure, employment: @social_assessment.employment, family_members: @social_assessment.family_members, issues: @social_assessment.issues, living_condition: @social_assessment.living_condition, supportive_care: @social_assessment.supportive_care } }
    end

    assert_redirected_to social_assessment_url(SocialAssessment.last)
  end

  test "should show social_assessment" do
    get social_assessment_url(@social_assessment)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_assessment_url(@social_assessment)
    assert_response :success
  end

  test "should update social_assessment" do
    patch social_assessment_url(@social_assessment), params: { social_assessment: { art_patient_id: @social_assessment.art_patient_id, date: @social_assessment.date, disclosure: @social_assessment.disclosure, employment: @social_assessment.employment, family_members: @social_assessment.family_members, issues: @social_assessment.issues, living_condition: @social_assessment.living_condition, supportive_care: @social_assessment.supportive_care } }
    assert_redirected_to social_assessment_url(@social_assessment)
  end

  test "should destroy social_assessment" do
    assert_difference('SocialAssessment.count', -1) do
      delete social_assessment_url(@social_assessment)
    end

    assert_redirected_to social_assessments_url
  end
end
