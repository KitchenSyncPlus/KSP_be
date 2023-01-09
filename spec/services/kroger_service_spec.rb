require 'rails_helper'

RSpec.describe KrogerService do
  let(:client_auth) { KrogerService.client_auth }
  let(:prod_search) {KrogerService.prod_search("butter")}

  xit 'retrives auth token', :vcr do
    expect(client_auth).to be_a(Hash)
    expect(client_auth[:expires_in]).to be_a(Integer)
    expect(client_auth[:access_token]).to be_a(String)
    expect(client_auth[:toke_type]).to eq('bearer')
  end

  xit 'can search products', :vcr do
    expect(prod_search).to be_a(Hash)
    expect(prod_search[:data]).to be_a(Array)
    first_hit = prod_search[:data].first
    expect(first_hit).to be_a(Hash)
    expect(first_hit[:productId]).to be_a(String)
    expect(first_hit[:productId]).not_to match(/\D/)
    expect(first_hit[:description]).to be_a(String)
    expect(first_hit[:description].downcase.include?('butter')).to be(True)
    expect(first_hit[:items]).to be_a(Array)
    item_info = first_hit[:items].first
    expect(item_info).to be_a(Hash)
    expect(item_info[:price][:regular]).to be_a(Float)
    expect(item_info[:size]).to be_a(String)
    expect(item_info[:soldBy]).to be_a(String)
  end
end
