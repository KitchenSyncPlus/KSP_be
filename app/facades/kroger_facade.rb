class KrogerFacade
  def self.client_auth
    Rails.cache.fetch(:kroger_bearer_token, expires_in: 30.minutes) do
      KrogerService.client_auth[:access_token]
    end
  end

  def self.prod_search(query)
    target_fields = %i[productId description price size soldBy]

    processed_hits = KrogerService.prod_search(query, client_auth)[:data]

    processed_hits.map! do |hit|
      hit[:items].first.each do |key, value|
        hit[key] = value if target_fields.include?(key)
      end
      hit.select { |key, _value| target_fields.include?(key) }
    end
  end
end