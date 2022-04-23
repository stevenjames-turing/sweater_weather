require './app/poros/concerns/date_formatter'

class DailyWeather
  include DateFormatter

  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon
  
  def initialize(weather_data)
    @date = date_formatter(weather_data[:dt]).strftime("%F")
    @sunrise = date_formatter(weather_data[:sunrise])
    @sunset = date_formatter(weather_data[:sunset])
    @max_temp = weather_data[:temp][:max]
    @min_temp = weather_data[:temp][:min]
    @conditions = weather_data[:weather][0][:description]
    @icon = weather_data[:weather][0][:icon]
  end
end