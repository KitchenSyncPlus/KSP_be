class KrogerService
  def self.conn
    Faraday.new(url: 'https://api.kroger.com')
  end

  def self.client_auth
    response = conn.post('/v1/connect/oauth2/token') do |f|
      f.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      f.headers['Authorization'] = "Basic #{ENV['kroger_key_encoded']}"
      f.headers['Scope'] = "product.compact"
      f.body = "grant_type=client_credentials&scope=product.compact"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.prod_search(query, token)
    response = conn.get("/v1/products?filter.term=#{query}&filter.locationId=62000033") do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
