class CreateCvs < ActiveRecord::Migration[7.1]
  def change
    create_table :cvs do |t|
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
