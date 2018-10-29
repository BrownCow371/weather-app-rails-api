Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#current_weather'
  # get '/search', to: 'searches#search'
  # post '/search', to: 'searches#openweathermap'

  scope '/api' do
    get '/weather', to: 'searches#current_weather'
    get '/forecast', to: 'searches#forecast_weather'
    get '/weather/:zip', to: 'searches#current_weather'
    get '/forecast/:zip', to: 'searches#forecast_weather'
  end
end
