class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { super_admin: 1, admin: 2 }

  belongs_to :employer

  scope :admin_or_above, -> { where("role >= ?", AdminUser.roles[:admin]) }

  def self.sort_with(field: 'email', direction: 'asc')
    return all if field.blank?

    order(field => direction)
  end
end
