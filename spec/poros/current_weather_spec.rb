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
  
  it 'has all required attributes' do 
    current = CurrentWeather.new(@weather_data)
  
    expect(current.datetime).to eq(Time.at(1650747631))
    expect(current.sunrise).to eq(Time.at(1650712400))
    expect(current.sunset).to eq(Time.at(1650761070))
    expect(current.temperature).to eq(84.09)
    expect(current.feels_like).to eq(83.08)
    expect(current.humidity).to eq(38)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq('broken clouds')
    expect(current.icon).to eq('04d')
  end
end