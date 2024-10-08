module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :credit_type, Int, null: false
    field :credit_type_in_raw, String, null: true
    field :description, String, null: true
    field :your_skills_and_experience, String, null: true
    field :employer_culture_description, String, null: true
    field :employer, EmployerType, null: true
    field :skillTags, String, null: false, method: :skill_tags_name
    field :primary_skill_tag, [String], null: true
    field :secondary_skill_tags, [String], null: false
    field :salary, String, null: false
    field :city, String, null: false
    field :address, String, null: true
    field :street_name, String, null: true
    field :street_number, String, null: true
    field :second_city, String, null: true
    field :posted_date, String, null: false, method: :created_at
    field :question, String, null: true
    field :employer_email, String, null: true
    field :second_employer_email, String, null: true
    field :prioritized_level, Int, null: true
    field :published_date, String, null: true, method: :published_at
    field :expired_date, String, null: true, method: :expired_at
    field :remainDays, Integer, null: true
    field :credit_provision_date, String, null: true
    field :views, Integer, null: false, method: :impressionist_show_count
    field :apps, Integer, null: false, method: :job_applications_count
    field :slug, String, null: false
    field :type, String, null: false
    field :status, String, null: false
    field :events, [String], null: true
    field :ai_match_stats, String, null: true
    field :auto_accepted_candidates, [String], null: true
    field :remaining_credits, Int, null: true
    field :minimum_salary, Int, null: true
    field :maximum_salary, Int, null: true
    field :show_salary_range, Boolean, null: true
    field :benefit_1, String, null: true
    field :benefit_2, String, null: true
    field :benefit_3, String, null: true
    field :deleted_at, String, null: true
    field :percent_jobs_higher_in_maximum, Int, null: true
    field :percent_jobs_higher_in_minimum, Int, null: true
    field :usable_gemini, Boolean, null: false, method: :usable_gemini?
    field :invitations_today_count, Int, null: false
    field :limit_invitations_per_day, Int, null: true
    field :total_potential_candidates, Int, null: true
    field :location_id, Int, null: true
    field :second_location_id, Int, null: true
    field :main_location, String, null: true
    field :second_location, String, null: true
    field :publisher, AdminUserType, null: true
    field :google_indexed_at, String, null: true

    def self.authorized?(object, context)
      super && (context[:current_user].super_admin? || Ability.new(context[:current_user]).can?(:read, Job))
    end

    def employer
      object.employer
    end

    def salary
      object.decorate.formatted_salary
    end
  end
end
