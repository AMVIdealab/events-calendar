Rails.application.routes.draw do
  #get 'calendar/index'
  root to: "home#index"

  resources :events

  resources :places do
    resources :events
  end
  
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
