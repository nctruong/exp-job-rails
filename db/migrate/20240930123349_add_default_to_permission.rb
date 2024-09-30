class AddDefaultToPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :permissions, :default, :boolean
  end
end
