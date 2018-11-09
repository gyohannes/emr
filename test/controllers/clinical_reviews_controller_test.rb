require 'test_helper'

class ClinicalReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinical_review = clinical_reviews(:one)
  end

  test "should get index" do
    get clinical_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_clinical_review_url
    assert_response :success
  end

  test "should create clinical_review" do
    assert_difference('ClinicalReview.count') do
      post clinical_reviews_url, params: { clinical_review: { art_patient_id: @clinical_review.art_patient_id, clinical_review: @clinical_review.clinical_review, date: @clinical_review.date, who_staging: @clinical_review.who_staging } }
    end

    assert_redirected_to clinical_review_url(ClinicalReview.last)
  end

  test "should show clinical_review" do
    get clinical_review_url(@clinical_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinical_review_url(@clinical_review)
    assert_response :success
  end

  test "should update clinical_review" do
    patch clinical_review_url(@clinical_review), params: { clinical_review: { art_patient_id: @clinical_review.art_patient_id, clinical_review: @clinical_review.clinical_review, date: @clinical_review.date, who_staging: @clinical_review.who_staging } }
    assert_redirected_to clinical_review_url(@clinical_review)
  end

  test "should destroy clinical_review" do
    assert_difference('ClinicalReview.count', -1) do
      delete clinical_review_url(@clinical_review)
    end

    assert_redirected_to clinical_reviews_url
  end
end
