require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Users API endpoint' do
    it 'returns all users' do
      create_list(:user, 10)
      get '/api/v1/users'

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).not_to be_empty
    end

    xit 'creates a user' do
      post '/api/v1/users'
    end
  end
end
