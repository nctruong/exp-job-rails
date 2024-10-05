# == Schema Information
#
# Table name: admin_user_permissions
#
#  id            :bigint           not null, primary key
#  admin_user_id :bigint
#  permission_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class AdminUserPermission < ApplicationRecord
  belongs_to :admin_user
  belongs_to :permission
end
