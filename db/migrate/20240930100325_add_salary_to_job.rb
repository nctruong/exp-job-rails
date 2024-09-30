class AddSalaryToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :salary, :string
    add_column :jobs, :city, :string
    add_column :jobs, :address, :string
  end
end
