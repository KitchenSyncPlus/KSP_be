class KrogerFacade
  def self.client_auth
    KrogerService.client_auth[:access_token]
  end

  def self.prod_search(query)
    target_fields = %i[productId description items price size soldBy]
    processed_hit = KrogerService.prod_search(query)
    processed_hit.map do |hit|
      hit.select { |key, _value| target_fields.include?(key)}
    end
    processed_hit[:items].delete.first.each do |k, v|
      processed_hit[k] = v if target_fields.include?(key)
    end
  end
end 

#Rails.cache.fetch(:kroger_bearer_token, expires_in: 30.minutes) do