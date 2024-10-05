# == Schema Information
#
# Table name: permissions
#
#  id                  :bigint           not null, primary key
#  name                :string
#  subject_class       :string
#  action              :string
#  condition_attribute :string
#  condition_value     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  role                :string
#  default             :boolean
#
FactoryBot.define do
  factory :permission do
    name { "MyString" }
    subject_class { "MyString" }
    action { "MyString" }
    condition_attribute { "MyString" }
    role { "MyString" }
    default { false }
  end
end
