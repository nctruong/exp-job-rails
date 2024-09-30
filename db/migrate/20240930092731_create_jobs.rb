class CreateJobs < ActiveRecord::Migration[7.1]
  create_table :jobs do |t|
    t.string :title
    t.text :description
    t.integer :employer_id
    t.integer :category_id
    t.date :expired_at

    t.timestamps
  end
end
