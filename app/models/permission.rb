# == Schema Information
#
# Table name: permissions
#
#  id                  :bigint           not null, primary key
#  name                :string
#  subject_class       :string
#  action              :string
#  condition_attribute :string
#  condition_value     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  role                :string
#  default             :boolean
#
class Permission < ApplicationRecord
  ROLES = %w(all admin employer)
  has_many :admin_user_permissions, dependent: :destroy

  validates :subject_class, :action, presence: true
  validates :role, presence: true, inclusion: {in: ROLES}

  scope :for_employer, -> { where(role: %w(employer all)) }
  scope :for_admin,    -> { where(role: %w(admin all)) }
  scope :recent,       -> { order(created_at: :asc) }
end
