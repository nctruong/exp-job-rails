class Permission < ApplicationRecord
  ROLES = %w(all admin employer)
  has_many :admin_user_permissions, dependent: :destroy

  validates :subject_class, :action, presence: true
  validates :role, presence: true, inclusion: {in: ROLES}

  scope :for_employer, -> { where(role: %w(employer all)) }
  scope :for_admin,    -> { where(role: %w(admin all)) }
  scope :recent,       -> { order(created_at: :asc) }
end
