class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.string :fullname
      t.string :email
      t.text :advantages
      t.references :job

      t.timestamps
    end
  end
end
