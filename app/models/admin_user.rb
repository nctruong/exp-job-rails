class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { super_admin: 1, admin: 2, employer: 3 }

  belongs_to :employer

  has_many :admin_user_permissions, dependent: :destroy
  has_many :permissions, through: :admin_user_permissions

  scope :admin_or_above, -> { where("role >= ?", AdminUser.roles[:admin]) }

  def self.sort_with(field: 'email', direction: 'asc')
    return all if field.blank?

    order(field => direction)
  end
end
