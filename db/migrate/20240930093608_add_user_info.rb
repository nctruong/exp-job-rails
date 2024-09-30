class AddUserInfo < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :gender, :string
    add_column :users, :age_range, :integer
  end
end
