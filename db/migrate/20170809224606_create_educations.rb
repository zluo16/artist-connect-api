class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.references :user
      t.string :school_name
      t.string :education_level
      t.string :year_started
      t.string :year_completed
      t.string :gpa

      t.timestamps
    end
  end
end
