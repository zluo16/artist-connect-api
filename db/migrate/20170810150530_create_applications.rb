class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true
      t.references :job_posting, foreign_key: true
      t.text :resume
      t.text :cover_letter

      t.timestamps
    end
  end
end
