# Weather Activity - React-Rails Application

This application allows the user to fetch weather for a zipcode from the OpenWeatherMap API and then get a suggestion for an activity based on that weather. Users can add, update and remove activities from the master activity list.

## Installation

Clone down this repository and the sister repository at https://github.com/BrownCow371/weather-app-client-react. Run bundle, rake db:migrate and rake db:seed from your terminal for the rails directory. Also run npm install from the terminal in the react directory. Then, from the rails directory, in the terminal call 'rake start' to launch both servers. The application will be running on your localhost:3000 port and the API will be running on localhost:3001. 

In order for the weather portion of the application to work, you will need to either get your own API key from the OpenWeatherMap API (https://openweathermap.org/appid) and put it in an .env file at the root of the rails API repository with an APPID=YOURKEY (make sure there are no spaces or new lines after the key). Or you can use the sample data from the API by opening the searches_controller file in the Rails API repository and uncommenting the sample fetch in the current_weather action and commenting out the live api call code noted there. Note that the sample data is provided in degrees Kelvin. 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'BrownCow371'/weather-app-rails-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the envelope-budget-rails-app project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'BrownCow371'/weather-app-rails-api/blob/master/CODE_OF_CONDUCT.md).