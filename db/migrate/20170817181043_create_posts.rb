class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :text
      t.integer :likes
      t.string :link

      t.timestamps
    end
  end
end
