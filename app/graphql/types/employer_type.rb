module Types
  class EmployerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :total_employers, Int, null: true
    field :admin_users_count, Int, null: true
    field :culture_description, String, null: true
    field :created_at, String, null: false
    field :size, String, null: true
    field :short_description, String, null: true
    field :long_description, String, null: true
    field :jobs, [JobType], null: true
    field :admin_users, [AdminUserType], null: false

    def total_employers
      1000
    end

    def email
      'dummy'
    end

    def created_at
      l(object.created_at, format: :medium_with_time)
    end

    def jobs
      object.jobs.recent.limit(3)
    end
  end
end
