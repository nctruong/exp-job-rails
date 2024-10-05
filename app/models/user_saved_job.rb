# == Schema Information
#
# Table name: user_saved_jobs
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  job_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSavedJob < ApplicationRecord
end
