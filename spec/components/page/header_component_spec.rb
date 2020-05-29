require "rails_helper"

RSpec.describe Page::HeaderComponent, type: :component do
  it "renders page tile" do
    expect(
      render_inline(described_class.new(title: "Page Title")).to_html
    ).to include(
      "Page Title"
    )
  end
end
