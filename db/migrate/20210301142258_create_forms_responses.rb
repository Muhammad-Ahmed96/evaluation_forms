class CreateFormsResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :forms_responses do |t|
      t.integer :form_id
      t.integer :employee_id
      t.integer :supervisor_id
      t.integer :external_reviewer_id
      t.integer :password

      t.timestamps
    end
  end
end
