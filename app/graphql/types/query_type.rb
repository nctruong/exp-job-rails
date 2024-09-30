# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :admin_users, resolver: Resolvers::AdminUserListResolver, null: true
    field :admin_user_details, resolver: Resolvers::AdminUserDetailsResolver, null: true

    field :jobs, resolver: Resolvers::JobListResolver, null: true
  end
end
