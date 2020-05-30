# frozen_string_literal: true

# == Schema Information
#
# Table name: days
#
#  id                    :bigint           not null, primary key
#  allow_long_cook_times :boolean          default(FALSE)
#  plans_needed          :integer          not null
#  scheduled             :date             not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint           not null
#  week_id               :bigint           not null
#
# Indexes
#
#  index_days_on_user_id  (user_id)
#  index_days_on_week_id  (week_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (week_id => weeks.id)
#


require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:week) }
    it { is_expected.to have_many(:meals).through(:plans) }
    it { is_expected.to have_many(:plans) }
    it { is_expected.to have_many(:recipes).through(:plans) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:scheduled) }
    it { is_expected.to validate_presence_of(:plans_needed) }
  end

end
