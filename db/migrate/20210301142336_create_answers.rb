class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :value
      t.integer :forms_response_id

      t.timestamps
    end
  end
end
