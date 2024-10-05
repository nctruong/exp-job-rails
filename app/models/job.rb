# == Schema Information
#
# Table name: jobs
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  employer_id :integer
#  category_id :integer
#  expired_at  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  salary      :string
#  city        :string
#  address     :string
#
class Job < ApplicationRecord
  has_many :job_applications

  belongs_to :employer

  scope :recent, lambda { order("created_at DESC") }

  class << self
    def sort_with(field: 'published_at', direction: 'asc')
      order(field => direction)
    end
  end
end
