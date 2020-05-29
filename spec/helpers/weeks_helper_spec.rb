require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WeeksHelper. For example:
#
# describe WeeksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WeeksHelper, type: :helper do
  subject(:week) { create(:week) }
  describe '#week_start_display' do
    it 'returns mm/dd/yyyy format for week.start' do
      expect(week_start_display(week)).to eq week.start.strftime("%m-%d-%Y")
    end
  end
end
