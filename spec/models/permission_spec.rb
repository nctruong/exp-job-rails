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
require 'rails_helper'

RSpec.describe Permission, type: :model do

end
