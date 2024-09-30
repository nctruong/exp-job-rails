class AddRoleToPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :permissions, :role, :string
  end
end
