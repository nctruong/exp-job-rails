class CreateUserJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :user_job_applications do |t|
      t.references :user, :job_application
    end

    add_index :user_job_applications, [:user_id, :job_application_id]
  end
end
