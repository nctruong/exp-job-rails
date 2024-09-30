class CreateUserSavedJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :user_saved_jobs do |t|
      t.references :user
      t.references :job

      t.timestamps
    end
  end
end
