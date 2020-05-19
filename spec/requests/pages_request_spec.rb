# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /home' do
    xit 'returns http success' do
      get '/pages/home'
      expect(response).to have_http_status(:success)
    end
  end
end
