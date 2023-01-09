class KrogerFacade
  def self.client_auth
    KrogerService.client_auth[:access_token]
  end

  def self.prod_search(query)
    target_fields = %i[productId description items price size soldBy]
    processed_hits = KrogerService.prod_search(query).first(20)

    processed_hits.map do |hit|
      hit.select { |key, _value| target_fields.include?(key) }
    end

    processed_hits.each_with_index do |hit, index|
      hit[:items].delete.first.each do |key, value|
        processed_hit[index][key] = value if target_fields.include?(key)
      end
    end
  end
end