class ApplicationController < ActionController::API
  def kroger_client_auth
    Rails.cache.fetch(:kroger_bearer_token, expires_in: 30.minutes) do
      KrogerFacade.client_auth
    end
  end
end
