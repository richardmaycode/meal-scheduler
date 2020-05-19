# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipes::RecipeScorer do
  describe 'call' do
    it 'returns a score' do
      expect(described_class.call(nil, nil)).to eq 10
    end
  end
end
