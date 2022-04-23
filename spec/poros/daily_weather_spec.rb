require 'rails_helper'

RSpec.describe DailyWeather do 

  before(:each) do 
    @weather_data = {
                      "dt": 1650733200,
                      "sunrise": 1650712400,
                      "sunset": 1650761070,
                      "moonrise": 1650699540,
                      "moonset": 1650733920,
                      "moon_phase": 0.75,
                      "temp": {
                          "day": 82.38,
                          "min": 66.13,
                          "max": 83.57,
                          "night": 69.31,
                          "eve": 75.27,
                          "morn": 68.92
                      },
                      "feels_like": {
                          "day": 82.17,
                          "night": 69.33,
                          "eve": 75.42,
                          "morn": 68.85
                      },
                      "pressure": 1013,
                      "humidity": 43,
                      "dew_point": 57.67,
                      "wind_speed": 20.29,
                      "wind_deg": 185,
                      "wind_gust": 38.16,
                      "weather": [
                          {
                              "id": 801,
                              "main": "Clouds",
                              "description": "few clouds",
                              "icon": "02d"
                          }
                      ],
                      "clouds": 19,
                      "pop": 0,
                      "uvi": 0
                    }
  end

  it 'will create a DailyWeather object' do 
    daily = DailyWeather.new(@weather_data)

    expect(daily).to be_a DailyWeather
  end
  
  it 'has all required attributes' do 
    daily = DailyWeather.new(@weather_data)
  
    expect(daily.date).to eq(Time.at(1650733200).strftime("%F"))
    expect(daily.sunrise).to eq(Time.at(1650712400))
    expect(daily.sunset).to eq(Time.at(1650761070))
    expect(daily.max_temp).to eq(83.57)
    expect(daily.min_temp).to eq(66.13)
    expect(daily.conditions).to eq('few clouds')
    expect(daily.icon).to eq('02d')
  end
end