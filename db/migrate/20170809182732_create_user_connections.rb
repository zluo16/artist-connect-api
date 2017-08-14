class CreateUserConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :user_connections do |t|
      t.references :connector
      t.references :connectee

      t.timestamps
    end
  end
end
