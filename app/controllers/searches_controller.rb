class SearchesController < ApplicationController
# for future user authentication
    # before_action :authenticate_user

# save working on this functionality for another day:
    # def forecast_weather
    #     @resp =Faraday.get 'http://api.openweathermap.org/data/2.5/forecast' do |req|
    #         req.params['APPID'] = ENV['APPID']
    #         req.params['zip'] = params[:zip]
    #         req.params['units'] = 'imperial'
    #     end

    #     body_hash = JSON.parse(@resp.body)
    #     render :json => body_hash
    # end

    def current_weather
        # find and use existing weather if it is less than 15 minutes old. else fetch new data
   
        existing_weather = Weather.find_by(zip: params[:zip]) 
      
        if existing_weather && ((existing_weather.updated_at + (60 * 15)) > Time.now)

            render :json => existing_weather
        
        else
            # temporarily fetching sample data
            # @resp =Faraday.get 'https://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b6907d289e10d714a6e88b30761fae22' do |req|
            @resp = Faraday.get 'http://api.openweathermap.org/data/2.5/weather' do |req|
                req.params['APPID'] = ENV['APPID']
                req.params['zip'] = params[:zip]
                req.params['units'] = 'imperial'
            end
        
            body = JSON.parse(@resp.body)         
            current_weather = Weather.find_or_create_by(zip: params[:zip]) 
            weather_hash = build_weather_hash(body)
            current_weather.update(weather_hash) 
            
            render :json => current_weather
        end
    end

    def activity_suggestion
        activity  = Activity.suggestion(params[:zip])
        render :json => activity
    end

    private

    def build_weather_hash(body)

        {
                zip: params[:zip], 
                date: body["dt"], 
                desc: body["weather"][0]["description"],
                icon: body["weather"][0]["icon"],
                main: body["weather"][0]["main"], 
                code: body["weather"][0]["id"],
                temp: body["main"]["temp"],
                humidity: body["main"]["humidity"],
                wind_speed: body["wind"]["speed"]                
            }
    end
end
