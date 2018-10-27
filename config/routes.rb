Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#openweathermap'
  # get '/search', to: 'searches#search'
  # post '/search', to: 'searches#openweathermap'

  # scope '/api' do
  #   get :weather, to: 'searches#openweathermap'
  # end
end
