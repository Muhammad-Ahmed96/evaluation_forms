require "test_helper"

class FormsResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forms_response = forms_responses(:one)
  end

  test "should get index" do
    get forms_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_forms_response_url
    assert_response :success
  end

  test "should create forms_response" do
    assert_difference('FormsResponse.count') do
      post forms_responses_url, params: { forms_response: { employee_id: @forms_response.employee_id, external_reviewer_id: @forms_response.external_reviewer_id, form_id: @forms_response.form_id, password: @forms_response.password, supervisor_id: @forms_response.supervisor_id } }
    end

    assert_redirected_to forms_response_url(FormsResponse.last)
  end

  test "should show forms_response" do
    get forms_response_url(@forms_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_forms_response_url(@forms_response)
    assert_response :success
  end

  test "should update forms_response" do
    patch forms_response_url(@forms_response), params: { forms_response: { employee_id: @forms_response.employee_id, external_reviewer_id: @forms_response.external_reviewer_id, form_id: @forms_response.form_id, password: @forms_response.password, supervisor_id: @forms_response.supervisor_id } }
    assert_redirected_to forms_response_url(@forms_response)
  end

  test "should destroy forms_response" do
    assert_difference('FormsResponse.count', -1) do
      delete forms_response_url(@forms_response)
    end

    assert_redirected_to forms_responses_url
  end
end
