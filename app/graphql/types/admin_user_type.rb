module Types
  # Create a AdminUserType to represent the AdminUser model in GraphQL
  class AdminUserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
  end
end
