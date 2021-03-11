class AddPasswordToForms < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :password, :string
  end
end
