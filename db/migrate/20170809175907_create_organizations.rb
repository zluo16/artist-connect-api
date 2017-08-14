class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :organization_type
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
