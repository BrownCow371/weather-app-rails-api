Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#current_weather'
 
  scope '/api' do
    post 'user_token' => 'user_token#create'
    get '/weather', to: 'searches#current_weather'
    get '/forecast', to: 'searches#forecast_weather'
    get '/weather/:zip', to: 'searches#current_weather'
    get '/forecast/:zip', to: 'searches#forecast_weather'
    resources :activities
  end
end
