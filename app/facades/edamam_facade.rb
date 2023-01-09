class EdamamFacade
  def self.recipe_search(query)
    target_fields = %i[ext_id label thumbnail_url source_url yield ingredientLines]

    results = EdamamService.recipe_search(query)[:hits].first(20)

    results[:hits].map do |raw_hit|
      raw_hit[:recipe]
    end

    results[:hits].map do |hit|
      hit[:ext_id] = hit[:uri].split("recipe_")[1]

      hit.select { |key, _value| target_fields.include?(key) }
    end
  end

  def self.recipe_show(ext_id)
    target_fields = %i[ext_id label image source_url yield ingredientLines ingredients food quantity measure]

    processed_data = EdamamService.recipe_show(ext_id)

    processed_data.map do |raw_hit|
      raw_hit[:recipe]
    end

    processed_data.map do |hit|
      hit[:ext_id] = hit[:uri].split("recipe_")[1]
      hit[:source_url] = hit[:url]
      hit[:ingredients].map { |ingredient| ingredient.select { |key, _value| target_fields.include?(key) } }

      hit.select { |key, _value| target_fields.include?(key) }
    end
  end

  def self.recipe_ingredients(ext_id)
    target_fields = %i[ext_id label yield ingredientLines ingredients food quantity measure foodId]

    processed_data = EdamamService.recipe_show(ext_id)

    processed_data.map do |raw_hit|
      raw_hit[:recipe]
    end

    processed_data.map do |hit|
      hit[:ext_id] = hit[:uri].split("recipe_")[1]
      hit[:ingredients].map { |ingredient| ingredient.select { |key, _value| target_fields.include?(key) } }

      hit.select { |key, _value| target_fields.include?(key) }
    end
  end
end
