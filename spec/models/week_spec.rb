# == Schema Information
#
# Table name: weeks
#
#  id         :bigint           not null, primary key
#  start      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_weeks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Week, type: :model do
  subject(:week) { create(:week) }
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:days) }
    it { should have_many(:plans).through(:days) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start) }
  end
end
