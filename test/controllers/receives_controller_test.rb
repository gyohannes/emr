require 'test_helper'

class ReceivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receife = receives(:one)
  end

  test "should get index" do
    get receives_url
    assert_response :success
  end

  test "should get new" do
    get new_receife_url
    assert_response :success
  end

  test "should create receife" do
    assert_difference('Receive.count') do
      post receives_url, params: { receife: { deliverer_name: @receife.deliverer_name, delivery_date: @receife.delivery_date, recipient_name: @receife.recipient_name, remark: @receife.remark, store_id: @receife.store_id, witness_name: @receife.witness_name } }
    end

    assert_redirected_to receife_url(Receive.last)
  end

  test "should show receife" do
    get receife_url(@receife)
    assert_response :success
  end

  test "should get edit" do
    get edit_receife_url(@receife)
    assert_response :success
  end

  test "should update receife" do
    patch receife_url(@receife), params: { receife: { deliverer_name: @receife.deliverer_name, delivery_date: @receife.delivery_date, recipient_name: @receife.recipient_name, remark: @receife.remark, store_id: @receife.store_id, witness_name: @receife.witness_name } }
    assert_redirected_to receife_url(@receife)
  end

  test "should destroy receife" do
    assert_difference('Receive.count', -1) do
      delete receife_url(@receife)
    end

    assert_redirected_to receives_url
  end
end
