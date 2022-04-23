class OpenweatherFacade
  def self.daily_weather(latitude, longitude)
    json = OpenweatherService.all_weather(latitude, longitude)

    # Creates objects for only the next 5 days
    @daily_weather = json[:daily][0..4].map do |day_data|
      DailyWeather.new(day_data)
    end
  end
end