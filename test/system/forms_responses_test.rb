require "application_system_test_case"

class FormsResponsesTest < ApplicationSystemTestCase
  setup do
    @forms_response = forms_responses(:one)
  end

  test "visiting the index" do
    visit forms_responses_url
    assert_selector "h1", text: "Forms Responses"
  end

  test "creating a Forms response" do
    visit forms_responses_url
    click_on "New Forms Response"

    fill_in "Employee", with: @forms_response.employee_id
    fill_in "External reviewer", with: @forms_response.external_reviewer_id
    fill_in "Form", with: @forms_response.form_id
    fill_in "Password", with: @forms_response.password
    fill_in "Supervisor", with: @forms_response.supervisor_id
    click_on "Create Forms response"

    assert_text "Forms response was successfully created"
    click_on "Back"
  end

  test "updating a Forms response" do
    visit forms_responses_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @forms_response.employee_id
    fill_in "External reviewer", with: @forms_response.external_reviewer_id
    fill_in "Form", with: @forms_response.form_id
    fill_in "Password", with: @forms_response.password
    fill_in "Supervisor", with: @forms_response.supervisor_id
    click_on "Update Forms response"

    assert_text "Forms response was successfully updated"
    click_on "Back"
  end

  test "destroying a Forms response" do
    visit forms_responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forms response was successfully destroyed"
  end
end
