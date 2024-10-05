# == Schema Information
#
# Table name: admin_users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer
#  employer_id            :integer
#
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
