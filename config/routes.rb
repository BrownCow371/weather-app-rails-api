Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  scope '/api' do
  #  user authentication
    post '/login', to: 'sessions#create'
    
  # future forecase functionality
    # get '/forecast/:zip', to: 'searches#forecast_weather'

    get '/weather/:zip', to: 'searches#current_weather'
    get '/weather/:zip/suggestion', to: 'searches#activity_suggestion'
    resources :activities, only: [:index, :update, :create, :destroy]
    resources :conditions, only: [:index]
    resources :users, only: [:create, :show, :update, :destroy]
  end
end
