class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :locatable, polymorphic: true, index: true
      t.string :address
      t.string :city
      t.string :state
      t.string :suite
      t.string :zipcode
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
