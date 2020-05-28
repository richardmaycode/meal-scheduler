class DaysComponent < ViewComponent::Base
  def initialize(days:, user:)
    @days = days
    @user = user
  end

  private 

  attr_reader :days, :user
end
