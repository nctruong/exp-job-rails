# == Schema Information
#
# Table name: applicants
#
#  id         :bigint           not null, primary key
#  email      :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Applicant < ApplicationRecord
end
