require 'rails_helper'

RSpec.describe KrogerFacade do
  let(:client_auth) { KrogerFacade.client_auth }
  let(:prod_search) { KrogerFacade.prod_search("butter") }

  context '#auth' do
    it 'extracts access token from api if doesnt exist/is expired', :vcr do
      expect(client_auth).to be_a(String)
    end

    it "doesn't refresh token if not yet expired", :vcr do
      token = KrogerFacade.client_auth
      expect(client_auth).to eq(token)
    end

    # To Do: Add method to check expired token refreshment

  end

  context '#prod_search' do
    it 'searches product and has relevant data', :vcr do
      expect(prod_search).to be_a(Array)
      first_hit = prod_search[0]
      expect(first_hit).to be_a(Hash)
      expect(first_hit.keys).to eq([:productId, :description, :price, :size, :soldBy])
      expect(first_hit[:productId]).to be_a(String)
      expect(first_hit[:productId]).not_to match(/\D/)
      expect(first_hit[:description]).to be_a(String)
      expect(first_hit[:description].downcase.include?('butter')).to be(true)
      expect(first_hit[:price][:regular]).to be_a(Float)
      expect(first_hit[:size]).to be_a(String)
      expect(first_hit[:soldBy]).to be_a(String)
    end
  end
end
