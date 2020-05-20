class Page::HeaderComponent < ViewComponent::Base
  def initialize(title: nil, subtitle: nil, back_link: nil)
    @title = title
    @subtitle = subtitle
    @back_link = back_link
  end
  
  private

  attr_reader :title, :subtitle, :back_link
end
