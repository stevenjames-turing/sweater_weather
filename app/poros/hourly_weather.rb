class HourlyWeather
  include DateFormatter

  attr_reader :time, :temperature, :conditions, :icon

  def initialize(weather_data)
    @time = date_formatter(weather_data[:dt]).strftime("%H:%M:%S")
    @temperature = weather_data[:temp]
    @conditions = weather_data[:weather][0][:description]
    @icon = weather_data[:weather][0][:icon]
  end
end 