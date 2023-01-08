class KrogerService
  def self.client_auth
    Faraday.new(url: 'https://api.kroger.com/v1/connect/oauth2/token') do |f|
      f.params['Authorization'] = ENV['kroger_key_encoded']
    end
  end

  def self.conn(token)
    Faraday.new(url: 'https://api.kroger.com/v1') do |f|
      f.params['Authorization'] = "Bearer #{token}"
    end
  end

  def self.prod_search(query)
    response = conn.get("/products?filter.term=#{query}&filter.locationId=62000033")

    JSON.parse(response.body, symbolize_names: true)
  end
end
