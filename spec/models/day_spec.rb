# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:day_meals) }
    it { is_expected.to have_many(:meals).through(:day_meals) }
    it { is_expected.to have_many(:plans) }
    it { is_expected.to have_many(:recipes).through(:plans) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:scheduled) }
  end
end
