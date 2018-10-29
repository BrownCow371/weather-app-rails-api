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
        # find and use existing weather if it is more than 15 minutes old. else fetch new data
    #    
        existing_weather = Weather.find_by(zip: params[:zip]) 
        # binding.pry
        if existing_weather && ((existing_weather.updated_at + (60 * 15)) > Time.now)
            render :json => existing_weather
        else
            # @resp =Faraday.get 'https://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b6907d289e10d714a6e88b30761fae22' do |req|
            @resp = Faraday.get 'http://api.openweathermap.org/data/2.5/weather' do |req|
                req.params['APPID'] = ENV['APPID']
                req.params['zip'] = params[:zip]
                req.params['units'] = 'imperial'
            end
        
            body = JSON.parse(@resp.body)

            new_weather_hash = {
                zip: params[:zip], 
                date: body["dt"], 
                description: body["weather"][0]["description"],
                icon: body["weather"][0]["icon"],
                main: body["weather"][0]["main"], 
                temp: body["main"]["temp"],
                humidity: body["main"]["humidity"],
                wind_speed: body["wind"]["speed"]
            }
            
            current_weather = Weather.find_or_create_by(zip: params[:zip]) 
            
            current_weather.update(new_weather_hash) 
            
            # do |w|
            #     w.date = body["dt"]
            #     w.description =  body["weather"][0]["description"]
            #     w.icon = body["weather"][0]["icon"]
            #     w.main = body["weather"][0]["main"]
            #     w.temp = body["main"]["temp"]
            #     w.humidity = body["main"]["humidity"]
            #     w.wind_speed = body["wind"]["speed"]
            # end
            # render :json => body
            render :json => current_weather
        end
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