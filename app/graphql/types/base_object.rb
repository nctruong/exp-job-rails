# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    delegate :can?, :cannot?, to: :ability

    def ability
      Ability.new(current_user)
    end

    def current_user
      context[:current_user]
    end
  end
end
