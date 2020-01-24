Rails.application.routes.draw do
  #get 'calendar/index'
  root to: "home#index"

  resources :events

  resources :places do
    resources :events
  end
  
  get '/calendar', to: 'calendar#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
