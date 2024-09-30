module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :employer, EmployerType, null: true
    field :salary, String, null: false
    field :city, String, null: false
    field :address, String, null: true

    def employer
      object.employer
    end

    def salary
      object.decorate.formatted_salary
    end
  end
end
