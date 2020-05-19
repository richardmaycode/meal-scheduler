# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Meal, type: :model do
  subject { create(:meal) }

  context 'associations' do
    it { is_expected.to define_enum_for(:status) }
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(75) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
