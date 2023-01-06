class RecipeService
  def self.conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params['app_id'] =  ENV['edamam_app_id']
      faraday.params['app_key'] =  ENV['edamam_app_key']
    end
  end

  def self.recipes
    response = conn.get("/api/recipes/v2?type=public&beta=true&q=avocado&")
    #q will be params[:q] from search view
    data = JSON.parse(response.body, symbolize_names: :true)
  end
end
