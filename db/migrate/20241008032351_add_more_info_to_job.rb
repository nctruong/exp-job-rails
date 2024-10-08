class AddMoreInfoToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :slug, :string , null: true
    add_column :jobs, :employer_short_description, :text , null: true
    add_column :jobs, :employer_culture_description, :text , null: true
    add_column :jobs, :your_skills_and_experience, :text , null: true
    add_column :jobs, :employer_long_description, :text , null: true
    add_column :jobs, :question, :text , null: true
    add_column :jobs, :job_applications_count, :integer , default: 0
    add_column :jobs, :employer_email, :string , null: true
    add_column :jobs, :status, :string, default: 'Draft'
    add_column :jobs, :deleted_at, :datetime , null: true
    add_column :jobs, :second_employer_email, :string , null: true
    add_column :jobs, :second_city, :string , null: true
    add_column :jobs, :impressionist_search_count, :integer , default: 0
    add_column :jobs, :impressionist_show_count, :integer , default: 0
    add_column :jobs, :credit_type, :integer
    add_column :jobs, :reposted_at, :datetime , null: true
    add_column :jobs, :street_name, :string , null: true
    add_column :jobs, :street_number, :string , null: true
    add_column :jobs, :published_at, :datetime , null: true
    add_column :jobs, :prioritized_level, :integer , null: true
    add_column :jobs, :minimum_salary, :integer , null: true
    add_column :jobs, :maximum_salary, :integer , null: true
    add_column :jobs, :show_salary_range, :boolean , null: true
    add_column :jobs, :benefit_1, :string , null: true
    add_column :jobs, :benefit_2, :string , null: true
    add_column :jobs, :benefit_3, :string , null: true
    add_column :jobs, :scanned_skill_tags, :text, array: true, default: []
    add_column :jobs, :location_id, :integer , null: true
    add_column :jobs, :second_location_id, :integer , null: true
    add_column :jobs, :total_sent, :integer , null: true
    add_column :jobs, :google_indexed_at, :datetime , null: true
    add_column :jobs, :publisher_id, :integer , null: true
    add_column :jobs, :gemini_at, :datetime , null: true
  end
end
