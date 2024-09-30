class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :subject_class
      t.string :action
      t.string :condition_attribute
      t.string :condition_value

      t.timestamps
    end
  end
end
