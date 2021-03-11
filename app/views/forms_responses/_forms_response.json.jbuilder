json.extract! forms_response, :id, :form_id, :employee_id, :supervisor_id, :external_reviewer_id, :password, :created_at, :updated_at
json.url forms_response_url(forms_response, format: :json)
