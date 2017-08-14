class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.string :title
      t.string :start_year
      t.string :end_year

      t.timestamps
    end
  end
end
