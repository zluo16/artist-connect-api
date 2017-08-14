class CreateOrganizationConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_connections do |t|
      t.references :org_connector
      t.references :connected_org

      t.timestamps
    end
  end
end
