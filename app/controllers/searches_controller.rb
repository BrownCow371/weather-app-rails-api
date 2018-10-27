class SearchesController < ApplicationController
    
    def search
    end

    def openweathermap
        @resp =Faraday.get 'https://samples.openweathermap.org/data/2.5/forecast?zip=94040&appid=b6907d289e10d714a6e88b30761fae22' do |req|
        end

        body_hash = JSON.parse(@resp.body)
        render json: body_hash["list"]
    end
end

# real api address: api.openweathermap.org/data/2.5/forecast?zip={zip code}&units=imperial
# req.params['client_id'] = client_id
# req.params['client_secret'] = client_secret
# req.params['zip'] = params[:zipcode]
# req.params['units'] = 'imperial'