module Resolvers
  class AdminUserListResolver < BaseResolver
    type [Types::AdminUserType], null: false

    argument :name, String, required: false, default_value: ''
    argument :admin_only, Boolean, required: false, default_value: false
    argument :ids, [String], required: false, default_value: []
    argument :params, Types::AdminUserFilterParams, required: false, default_value: {}

    def resolve(name:, admin_only:, ids:, params:)
      authorize :read, AdminUser

      return AdminUser.where(id: ids).limit(10) if ids.present?

      AdminUserQuery.new(params.to_h.merge(admin_only: admin_only, name: name)).all.decorate
    end

  end
end
