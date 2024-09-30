class Employer < ApplicationRecord
  has_many :admin_users
  has_many :jobs
end
