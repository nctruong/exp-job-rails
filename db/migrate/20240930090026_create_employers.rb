class CreateEmployers < ActiveRecord::Migration[7.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.text :culture_description

      t.timestamps
    end
  end
end
