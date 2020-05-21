# frozen_string_literal: true

# == Schema Information
#
# Table name: cuisines
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  subject { create(:cuisine) }

  context 'associations' do
    it { is_expected.to define_enum_for(:status) }
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(15) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
