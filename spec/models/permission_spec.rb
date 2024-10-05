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
  let(:permission1) { create(:permission, role: :employer) }
  let(:permission2) { create(:permission, role: :all) }
  let(:permission3) { create(:permission, role: :admin) }

  describe '.for_employer' do
    it 'only returns employer or all roles' do
      expect(Permission.for_employer).to eq([permission1, permission2])
    end

    it 'does not returns admin role' do
      expect(Permission.for_employer.any? { |p| p.admin? }).to be_falsy
    end
  end
end
