class SearchesController < ApplicationController
# for future user authentication
    # before_action :authenticate
    before_action :set_weather, only: [:current_weather]

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
        # find and use existing weather if it is less than 30 minutes old. else fetch new data
     
        if validate_zip 
            
            if @weather && ((@weather.updated_at + (60 * 30)) > Time.now)

                render(
                    status: 200,
                    json: @weather
                )
            else        
                @resp = call_weather_api(params[:zip])
                process_response(@resp)
            end       
            
        else 
            render status: 400, json: {error:'Expected zipcode to be a 5 digit number.'}
        end
    end

    def activity_suggestion

        if set_activity
            render(
                status: 200, 
                json: @activity
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'All activities excluded per weather conditions.'}
            )
        end
    end



    private

    def set_weather
        if validate_zip
            @weather =  Weather.find_by(zip: params[:zip])
        end
    end

    def validate_zip
        params[:zip].match(/\b\d{5}\b/)
    end

    def set_activity
        if validate_zip
            @activity = Activity.suggestion(params[:zip])
        end
    end

    def call_weather_api(zip)

        # to fetch sample data uncomment these lines and comment out the ones for fetching live data below.
            # Faraday.get 'https://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b6907d289e10d714a6e88b30761fae22' do |req|
            # end
        
        # to fetch live API data using your APP ID key  - 
        # be sure to put your APPID=YOURKEY in a .env file at the root of this repository.)
        Faraday.get 'http://api.openweathermap.org/data/2.5/weather' do |req|
            req.params['APPID'] = ENV['APPID']
            req.params['zip'] = zip
            req.params['units'] = 'imperial'
        end

    end

    def process_response(response)
        if  response.status >= 400
            render status: response.status, json: {error: 'No data found for provided zipcode.'}
        else 
            body = JSON.parse(response.body)         
            @weather = Weather.find_or_create_by(zip: params[:zip]) 
            weather_hash = build_weather_hash(body)
            @weather.update(weather_hash) 
            
            render(
                status: 200,
                json: @weather
            )
        end
    end

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
