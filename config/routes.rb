Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#current_weather'
 
  scope '/api' do
  # for future user authentication
    # post 'user_token' => 'user_token#create'
    
  # future forecase functionality
    # get '/forecast/:zip', to: 'searches#forecast_weather'

    get '/weather/:zip', to: 'searches#current_weather'
    get '/weather/:zip/suggestion', to: 'searches#activity_suggestion'
    resources :activities, only: [:index, :show, :update, :create, :destroy]
    resources :conditions, only: [:index]
  end
end
