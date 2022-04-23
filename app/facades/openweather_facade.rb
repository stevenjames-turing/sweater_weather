class OpenweatherFacade
  def self.daily_weather(latitude, longitude)
    json = OpenweatherService.all_weather(latitude, longitude)

    @daily_weather = json[:daily].map do |day_data|
      DailyWeather.new(day_data)
    end
  end
end