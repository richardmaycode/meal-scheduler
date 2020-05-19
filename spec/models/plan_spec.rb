# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:day) }
    it { is_expected.to belong_to(:user) }
  end
end
