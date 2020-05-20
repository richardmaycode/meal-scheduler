class PageComponent < ViewComponent::Base
  with_content_areas :header, :body
  
  def initialize(subject: nil)
    @subject = subject
  end
end
