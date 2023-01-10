Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :users, only: %i[index show create]
      resources :groups, only: [:index]
      # get '/recipes/search', to: 'recipes#search'
    end
  end
end
