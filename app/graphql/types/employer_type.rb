module Types
  class EmployerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :second_email, String, null: true
    field :profile_complete, String, null: false
    field :super_hot_credits, Int, null: false
    field :hot_credits, Int, null: false
    field :regular_credits, Int, null: false
    field :gemini_low_credits, Int, null: false
    field :super_hot_expired_date, String, null: true
    field :hot_expired_date, String, null: true
    field :regular_expired_date, String, null: true
    field :gemini_low_expired_date, String, null: true
    field :total_jobs_posted, Int, null: true
    field :hn_credits_count, Int, null: true
    field :cs_credits_count, Int, null: true
    field :hn_expired_date, String, null: true
    field :cs_expired_date, String, null: true
    field :parent, EmployerType, null: true
    field :followers_count, Int, null: true
    field :page_views, Int, null: true
    field :avg_page_views, Float, null: true
    field :views_last_30_days, Int, null: true
    field :ranking_employer, Int, null: true
    field :total_employers, Int, null: true
    field :review_form_page_views, Int, null: true
    field :enabled_reviews, Boolean, null: true
    field :admin_users_count, Int, null: true
    field :culture_description, String, null: true
    field :locations, [String], null: false
    field :slug, String, null: false
    field :created_at, String, null: false
    field :company_type, String, null: true
    field :size, String, null: true
    field :facebook_url, String, null: true
    field :website_url, String, null: true
    field :work_on_saturday, Boolean, null: true
    field :overtime, Boolean, null: true
    field :overtime_compensation, String, null: true
    field :logo_url, String, null: true
    field :headline_photo_exists, Boolean, null: true
    field :headline_photo_url, String, null: true
    field :short_description, String, null: true
    field :long_description, String, null: true
    field :reason_to_join1, String, null: true
    field :reason_to_join2, String, null: true
    field :reason_to_join3, String, null: true
    field :primary_skill_tags, [String], null: true
    field :secondary_skill_tags, [String], null: true
    field :skill_tags, [String], null: true
    field :tech_stack_title, String, null: true
    field :tech_stack, String, null: true
    field :force_hide_in_search, Boolean, null: true
    field :slider_title, String, null: true
    field :job_description_photos, [String], null: true
    field :payment_info, String, null: true
    field :purchase_orders, [String], null: false
    field :jobs, [JobType], null: true
    field :online_jobs, [JobType], null: true
    field :gemini_jobs, [JobType], null: true
    field :hiring_nows, [String], null: false
    field :company_spotlights, [String], null: false
    field :admin_users, [String], null: false
    field :can_delete, Boolean, null: false
    field :credit_expired_date, String, null: true
    field :status_show_our_people, Boolean, null: true
    field :status_show_overtime, Boolean, null: true
    field :sub_employers, [EmployerType], null: true
    field :social_share_image_id, Int, null: true
    field :questions, [String], null: false
    field :employees, [String], null: false
    field :has_pending_po, Boolean, null: false
    field :live_jobs_count, Int, null: true
    field :tamsudev_reviews, [String], null: false, method: :tam_su_dev_reviews
    field :has_pending_hide_review_request, Boolean, null: false, method: :has_pending_hide_review_request?
    field :missing_informations, [String], null: false
    field :disabled_review, Boolean, null: true, method: :disabled_review?
    field :avg_overall_rate, Float, null: true
    field :total_tamsudev_reviews, Int, null: false
    field :has_paid_orders, Boolean, null: false, method: :has_paid_orders?
    field :latest_benefit1, String, null: true
    field :latest_benefit2, String, null: true
    field :latest_benefit3, String, null: true
    field :po_case, String, null: true
    field :total_online_jobs, Int, null: true
    field :events, [String], null: true

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
