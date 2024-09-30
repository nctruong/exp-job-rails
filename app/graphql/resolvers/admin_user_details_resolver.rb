module Resolvers
  class AdminUserDetailsResolver < BaseResolver
    type Types::AdminUserType, null: false

    # These args and resolve's args must be same.
    argument :id, Integer, required: false
    argument :email, String, required: false

    def resolve(id: nil, email: nil)
      return AdminUser.find(id) if id
      return AdminUser.find_by(email: email) if email
      return AdminUser.last
    end
  end
end