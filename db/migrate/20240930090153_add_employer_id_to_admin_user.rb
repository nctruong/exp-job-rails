class AddEmployerIdToAdminUser < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :employer_id, :integer
    add_index :admin_users, :employer_id
  end
end
