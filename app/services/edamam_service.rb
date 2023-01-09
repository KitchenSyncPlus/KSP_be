class EdamamService
  def self.conn
    Faraday.new(url: "https://api.edamam.com/api") do |f|
      f.params['app_id'] = ENV['edamam_app_id']
      f.params['app_key'] = ENV['edamam_app_key']
    end
  end

  def self.recipe_search(query)
    response = conn.get("/api/recipes/v2?type=public&beta=true&q=#{query}")

    # ruby doesnt like the nulls, so had to do a gsub
    JSON.parse(response.body.gsub('null', '"null"'), symbolize_names: true)
  end

  def self.recipe_show(ext_id)
    response = conn.get("/api/recipes/v2/#{ext_id}?type=public")

    JSON.parse(response.body.gsub('null', '"null"'), symbolize_names: true)
  end
end