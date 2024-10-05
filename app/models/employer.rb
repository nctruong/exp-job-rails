# == Schema Information
#
# Table name: employers
#
#  id                  :bigint           not null, primary key
#  name                :string
#  short_description   :string
#  long_description    :text
#  culture_description :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  city                :string
#  district            :string
#
class Employer < ApplicationRecord
  has_many :admin_users
  has_many :jobs
end
