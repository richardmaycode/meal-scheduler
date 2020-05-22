# == Schema Information
#
# Table name: weeks
#
#  id         :bigint           not null, primary key
#  start      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_weeks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :week do
    start { "2020-05-22" }
    user
  end
end
