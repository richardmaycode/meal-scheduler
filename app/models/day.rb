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


class Day < ApplicationRecord
  # associations
  belongs_to :user
  has_many :day_meals
  has_many :meals, through: :day_meals
  has_many :plans
  has_many :recipes, through: :plans

  # validations
  validates :scheduled, presence: true
end
