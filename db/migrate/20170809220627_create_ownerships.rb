class CreateOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships do |t|
      t.references :owner
      t.references :owned_org
      t.string :relation

      t.timestamps
    end
  end
end
