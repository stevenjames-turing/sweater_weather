require 'rails_helper'

RSpec.describe Roadtrip do 

  before(:each) do 
    @start_city = 'st. louis, mo'
    @destination = 'denver, co'
    weather_data = {
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
    @current_weather = CurrentWeather.new(weather_data)
    @travel_time = "01:45:23"
  end

  it 'will create a Roadtrip object' do 
    roadtrip = Roadtrip.new(@start_city, @destination, @travel_time, @current_weather)

    expect(roadtrip).to be_a Roadtrip
  end
  
  it 'has all required attributes' do 
    roadtrip = Roadtrip.new(@start_city, @destination, @travel_time, @current_weather)

    expect(roadtrip.id).to eq('null')
    expect(roadtrip.start_city).to eq('st. louis, mo')
    expect(roadtrip.end_city).to eq('denver, co')
    expect(roadtrip.travel_time).to eq("01:45:23")
    expect(roadtrip.weather_at_eta).to eq({
                                    "temperature": 84.09,
                                    "conditions": "broken clouds"
                                  })
  end
end