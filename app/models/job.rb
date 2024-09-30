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
