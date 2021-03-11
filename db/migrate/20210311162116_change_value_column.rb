class ChangeValueColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :value, :string
  end
end
