class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :label
      t.integer :form_id

      t.timestamps
    end
  end
end
