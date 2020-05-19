# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
  subject { create(:user_recipe) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:recipe) }
  end
end
