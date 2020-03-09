Rails.application.routes.draw do
  #get 'calendar/index'
  
  root to: "home#index"

  resources :categories
  resources :events

  resources :places do
    resources :events
  end
  
  get 'eventi/:city', to: 'events#city_events', as: 'eventi'
  

  get '/calendar', to: 'calendar#index'
  
  namespace :api do
    #scope module: :v1 do
    namespace :v1 do
      resources :events 
      resources :places do
        resources :events
      end
    end
  end

end
