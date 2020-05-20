class BackLinkComponent < ViewComponent::Base
  def initialize(link: nil, title: nil)
    @link = link
    @title = title
  end

  private 
  
  attr_reader :title, :link

  def render?
    title && link
  end
end
