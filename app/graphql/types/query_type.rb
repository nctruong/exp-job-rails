# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :admin_users, resolver: Resolvers::AdminUserListResolver, null: true
    field :admin_user_details, resolver: Resolvers::AdminUserDetailsResolver, null: true

    field :jobs, resolver: Resolvers::JobListResolver, null: true
    field :job, resolver: Resolvers::JobDetails, null: true

    def current_user
      context[:current_user]
    end
  end
end
