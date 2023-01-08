class KrogerService
  def self.conn
    Faraday.new(url: 'https://api.kroger.com/v1')
  end

  def self.client_auth
    response = conn.get(url: '/connect/oauth2/token') do |f|
      f.params['Authorization'] = "Basic #{ENV['kroger_key_encoded']}"
      f.params['scope'] = 'product.compact'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.prod_search(query, token)
    response = conn.get("/products?filter.term=#{query}&filter.locationId=62000033") do |f|
      f.params['Authorization'] = "Bearer #{token}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
