require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
  subject { create(:user_recipe) }
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end
end
