class Days::DayComponent < ViewComponent::Base
  def initialize(day:)
    @day = day
  end

  private

  attr_reader :day
end
