# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def authorize(object, context)
      raise GraphQL::ExecutionError, "Not authorized" unless ability.can?(object, context)
    end

    def ability
      @ability ||= Ability.new(current_user)
    end

    def current_user
      context[:current_user]
    end
  end
end
