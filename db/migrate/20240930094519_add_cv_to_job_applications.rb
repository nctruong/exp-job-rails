class AddCvToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :cv_id, :integer
  end
end
