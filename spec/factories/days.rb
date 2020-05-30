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


FactoryBot.define do
  factory :day do
    scheduled { '2020-05-15' }
    plans_needed { 1 }
    user
    week
  end
end
