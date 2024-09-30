class AdminUserPermission < ApplicationRecord
  belongs_to :admin_user
  belongs_to :permission
end
