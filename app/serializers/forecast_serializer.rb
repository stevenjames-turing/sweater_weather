class ForecastSerializer

  def self.weather_forecasts(current_weather, hourly_weather, daily_weather)
    {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
              "current_weather": {
                                  "datetime": current_weather.datetime,
                                  "sunrise": current_weather.sunrise, 
                                  "sunset": current_weather.sunset,
                                  "temperature": current_weather.temperature,
                                  "feels_like": current_weather.feels_like,
                                  "humidity": current_weather.humidity, 
                                  "uvi": current_weather.uvi,
                                  "visibility": current_weather.visibility,
                                  "conditions": current_weather.conditions, 
                                  "icon": current_weather.icon
                                  },
              "daily_weather": [
                  daily_weather.each do |day|
                    {
                      "date": day.date,
                      "sunrise": day.sunrise,
                      "sunset": day.sunset,
                      "max_temp": day.max_temp, 
                      "min_temp": day.min_temp, 
                      "conditions": day.conditions, 
                      "icon": day.icon
                    }
                  end
                    ],
              "hourly_weather": [
                  hourly_weather.each do |hour|
                    {
                      "time": hour.time, 
                      "temperature": hour.temperature,
                      "conditions": hour.conditions, 
                      "icon": hour.icon
                    }
                  end
                ]
              }
        }
    }
  end
end
