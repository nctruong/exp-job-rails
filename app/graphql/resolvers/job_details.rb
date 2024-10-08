module Resolvers
  class JobDetails < BaseResolver
    type Types::JobType, null: true

    argument :id, String, required: true

    def resolve(id:)
      Job.find(id)
    end
  end
end
