# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  default_servings :integer          not null
#  name             :string           not null
#  username         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#


require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:user_recipes) }
    it { is_expected.to have_many(:favorite_user_recipes).conditions(is_favorite: true) }
    it { is_expected.to have_many(:kid_friendly_user_recipes).conditions(is_kid_friendly: true) }
    it { is_expected.to have_many(:recipes).through(:user_recipes) }
    it { is_expected.to have_many(:favorite_recipes).through(:favorite_user_recipes) }
    it { is_expected.to have_many(:kid_friendly_recipes).through(:kid_friendly_user_recipes) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(60) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(30) }
    it { is_expected.to validate_presence_of(:default_servings) }
    it { is_expected.to validate_inclusion_of(:default_servings).in_range(1..5) }
  end
end
