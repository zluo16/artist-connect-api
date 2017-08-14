class CreateJobPostings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_postings do |t|
      t.references :organization
      t.string :title
      t.text :description
      t.text :responsibilities
      t.text :qualifications

      t.timestamps
    end
  end
end
