class OpenweatherFacade

  def self.weather_forecast(location, forecast_type)
    coordinates = MapquestService.get_city_coordinates(location)
    json = OpenweatherService.all_weather(coordinates[:lat], coordinates[:lng])

    case forecast_type
    when "current"
      CurrentWeather.new(json[:current])
    when "hourly"
      hourly_weather = json[:hourly].map do |hour_data|
        HourlyWeather.new(hour_data)
      end
    when "daily"
      daily_weather = json[:daily][0..4].map do |day_data|
        DailyWeather.new(day_data)
      end
    end
  end
end