class CreateAdminUserPermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_user_permissions do |t|
      t.references :admin_user, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end
