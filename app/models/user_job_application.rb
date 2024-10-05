# == Schema Information
#
# Table name: user_job_applications
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint
#  job_application_id :bigint
#
class UserJobApplication < ApplicationRecord
end
