require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PlansHelper. For example:
#
# describe PlansHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PlansHelper, type: :helper do

  describe '#icon' do
    it 'returns icon matching the plans meal' do
      expect(icon('Breakfast')).to eq "fa-egg-fried"
    end
    it 'returns other icon when option is invalid' do
      expect(icon('test')).to eq "fa-brownie"
    end
  end
end
