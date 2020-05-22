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

class Week < ApplicationRecord
  # associations
  belongs_to :user
  has_many :days
  has_many :plans, through: :days

  # validations
  validates :start, presence: true
end
