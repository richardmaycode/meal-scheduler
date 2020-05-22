class WeeksComponent < ViewComponent::Base
  def initialize(weeks:, user:)
    @weeks = weeks
    @user = user
  end

  private

  attr_reader :weeks, :user
end
