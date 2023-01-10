require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'Groups API endpoint' do
    it 'returns all groups' do
      create_list(:group, 10)
      get '/api/v1/groups'

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(parsed_response).to_not be_empty
      expect(parsed_response).to have_key :data
      expect(parsed_response[:data]).to be_an Array
      parsed_response[:data].each do |group|
        expect(group).to be_a Hash
        expect(group).to have_key :type
        expect(group[:type]).to eq('group')
        expect(group).to have_key :attributes
        expect(group[:attributes]).to be_a Hash
        expect(group[:attributes]).to have_key :name
        expect(group[:attributes]).to have_key :about
        expect(group[:attributes]).to have_key :users
        expect(group[:attributes][:users]).to be_an Array
      end
    end
  end
end
