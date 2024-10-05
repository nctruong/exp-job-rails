# == Schema Information
#
# Table name: cvs
#
#  id           :bigint           not null, primary key
#  email        :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :integer
#  content      :text
#
class Cv < ApplicationRecord
end
