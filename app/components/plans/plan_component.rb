class Plans::PlanComponent < ViewComponent::Base
  include PlansHelper
  def initialize(plan:)
    @plan = plan
  end

  def icon_class
    icon(plan)
  end

  private

  attr_reader :plan
end
