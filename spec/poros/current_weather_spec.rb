require 'rails_helper'

RSpec.describe CurrentWeather do 

  before(:each) do 
    @weather_data = {
                      "dt": 1650747631,
                      "sunrise": 1650712400,
                      "sunset": 1650761070,
                      "temp": 84.09,
                      "feels_like": 83.08,
                      "pressure": 1011,
                      "humidity": 38,
                      "dew_point": 55.76,
                      "uvi": 0,
                      "clouds": 62,
                      "visibility": 10000,
                      "wind_speed": 19.95,
                      "wind_deg": 179,
                      "wind_gust": 35.46,
                      "weather": [
                                    {
                                      "id": 803,
                                      "main": "Clouds",
                                      "description": "broken clouds",
                                      "icon": "04d"
                                    }
                                  ]
                    }
  end

  it 'will create a CurrentWeather object' do 
    current = CurrentWeather.new(@weather_data)

    expect(current).to be_a CurrentWeather
  end
  
  
end