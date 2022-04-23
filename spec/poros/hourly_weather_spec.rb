require 'rails_helper'

RSpec.describe HourlyWeather do 

  before(:each) do 
    @weather_data = {
                      "dt": 1650736800,
                      "temp": 83.57,
                      "feels_like": 83.01,
                      "pressure": 1013,
                      "humidity": 41,
                      "dew_point": 57.4,
                      "uvi": 0,
                      "clouds": 0,
                      "visibility": 10000,
                      "wind_speed": 20.29,
                      "wind_deg": 185,
                      "wind_gust": 37.33,
                      "weather": [
                          {
                              "id": 800,
                              "main": "Clear",
                              "description": "clear sky",
                              "icon": "01d"
                          }
                      ],
                      "pop": 0
                    }
  end

  it 'will create a HourlyWeather object' do 
    hourly = HourlyWeather.new(@weather_data)

    expect(hourly).to be_a HourlyWeather
  end
  
  
end