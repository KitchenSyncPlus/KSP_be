class EdamamFacade
  def self.recipe_search(query)
    target_fields = %i[ext_id label thumbnail_url source_url yield ingredientLines]

    results = EdamamService.recipe_search(query)
    results[:hits] = results[:hits].first(20)

    results[:hits].map! do |raw_hit|
      raw_hit[:recipe]
    end

    results[:hits].map! do |hit|
      hit[:ext_id] = hit[:uri].split("recipe_")[1]
      hit[:thumbnail_url] = hit[:images][:THUMBNAIL][:url]
      hit[:source_url] = hit[:url]

      hit.select { |key, _value| target_fields.include?(key) }
    end
    results
  end

  def self.recipe_show(ext_id)
    target_fields = %i[ext_id label image source_url yield ingredientLines ingredients food quantity measure]

    processed_data = EdamamService.recipe_show(ext_id)[:recipe]

    processed_data[:ext_id] = processed_data[:uri].split("recipe_")[1]
    processed_data[:source_url] = processed_data[:url]
    processed_data[:ingredients].map! { |ingredient| ingredient.select { |key, _value| target_fields.include?(key) } }

    processed_data.select { |key, _value| target_fields.include?(key) }
  end

  def self.recipe_ingredients(ext_id)
    target_fields = %i[ext_id label yield ingredientLines ingredients food quantity measure foodId]

    processed_data = EdamamService.recipe_show(ext_id)[:recipe]

    processed_data[:ext_id] = processed_data[:uri].split("recipe_")[1]
    processed_data[:ingredients].map! { |ingredient| ingredient.select { |key, _value| target_fields.include?(key) } }

    processed_data.select { |key, _value| target_fields.include?(key) }
  end
end
