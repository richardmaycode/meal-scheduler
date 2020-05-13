class Recipe < ApplicationRecord
  # associations
  belongs_to :meal
  belongs_to :cuisine

  # validations
  validates :name, presence: true, length: {minimum: 5, maximum: 60}
  validates :cook_time, presence: true
  validates :servings, presence: true, inclusion: { in: 1..10 }

  # scopes

  # methods
  def baby_friendly_modifier
    return 50 unless !baby_friendly
    
    0 
  end 
end
