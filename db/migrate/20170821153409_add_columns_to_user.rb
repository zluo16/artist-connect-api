class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :about, :text
    add_column :users, :gender, :string
  end
end
