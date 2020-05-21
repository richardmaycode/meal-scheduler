# frozen_string_literal: true

# == Schema Information
#
# Table name: days
#
#  id         :bigint           not null, primary key
#  scheduled  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_days_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#


FactoryBot.define do
  factory :day do
    scheduled { '2020-05-15' }
    user { nil }
  end
end
