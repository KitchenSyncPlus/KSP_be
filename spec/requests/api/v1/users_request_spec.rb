require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Users API endpoint' do
    it 'returns all users' do
      create_list(:user, 10)
      get '/api/v1/users'

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to_not be_empty
    end

    it 'gets a single user' do
      user1 = User.create!(name: Faker::Name.name, email: Faker::Internet.email)
      user1.groups.create!(name: Faker::Color.color_name, about: Faker::Company.bs)

      get "/api/v1/users/#{user1.id}"

      user = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to be(200)
      expect(response.body).to_not be_empty
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a Hash
      expect(user[:data]).to have_key (:id)
      expect(user[:data]).to have_key (:type)
      expect(user[:data][:type]).to eq('user')
      expect(user[:data]).to have_key (:attributes)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:groups)
      expect(user[:data][:attributes][:groups]).to be_an Array
    end
  end
end
