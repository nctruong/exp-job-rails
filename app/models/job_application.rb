# == Schema Information
#
# Table name: job_applications
#
#  id         :bigint           not null, primary key
#  fullname   :string
#  email      :string
#  advantages :text
#  job_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cv_id      :integer
#
class JobApplication < ApplicationRecord
  belongs_to :job
end
