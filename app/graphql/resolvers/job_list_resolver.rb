module Resolvers
  class JobListResolver < BaseResolver
    type [Types::JobType], null: false

    argument :page_index, Int, required: false, default_value: 1
    argument :page_size, Int, required: false, default_value: 20
    argument :params, Types::JobFilterParams, required: false, default_value: {}
    argument :ids, [String], required: false, default_value: []

    def resolve(page_index:, page_size:, params:, ids:)
      context[:current_user].super_admin? || authorize(:read, Job)

      return Job.all.limit(page_size)
    end
  end
end
