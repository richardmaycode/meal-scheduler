class Weeks::WeekComponent < ViewComponent::Base
  include WeeksHelper
  def initialize(week:)
    @week = week
  end

  private 

  def url_text
    test week
  end

  attr_reader :week
end
