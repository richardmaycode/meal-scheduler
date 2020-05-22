class Page::HeaderComponent < ViewComponent::Base
  def initialize(title: nil, subtitle: nil, back_link: nil, buttons: [])
    @title = title
    @subtitle = subtitle
    @back_link = back_link
    @buttons = buttons
  end
  
  private

  attr_reader :title, :subtitle, :back_link, :buttons
end
