class SearchesController < ApplicationController
    
  
    def forecast_weather
        @resp =Faraday.get 'https://samples.openweathermap.org/data/2.5/forecast?zip=94040&appid=b6907d289e10d714a6e88b30761fae22' do |req|
            # req.params['APPID'] = ENV['APPID']
            # req.params['zip'] = params[:zipcode]
            # req.params['units'] = 'imperial'
        end

        body_hash = JSON.parse(@resp.body)
        render :json => body_hash
    end

    def current_weather
        @resp =Faraday.get 'https://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b6907d289e10d714a6e88b30761fae22' do |req|
            # req.params['APPID'] = ENV['APPID']
            # req.params['zip'] = params[:zipcode]
            # req.params['units'] = 'imperial'
        end

        body_hash = JSON.parse(@resp.body)
        render :json => body_hash
    end
end

#Forecast Data 
    # real api address: api.openweathermap.org/data/2.5/forecast?zip={zip code}&units=imperial
    # http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}
# Current Data:
    # api.openweathermap.org/data/2.5/weather?zip={zip code},{country code}
    # recommended that we store data...how do we check to see if we need to fetch new data?
# req.params['client_id'] = client_id
# req.params['client_secret'] = client_secret
# req.params['zip'] = params[:zipcode]
# req.params['units'] = 'imperial'