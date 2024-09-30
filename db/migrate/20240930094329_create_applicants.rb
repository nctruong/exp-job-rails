class CreateApplicants < ActiveRecord::Migration[7.1]
  def change
    create_table :applicants do |t|
      t.string :email
      t.references :user

      t.timestamps
    end
  end
end
