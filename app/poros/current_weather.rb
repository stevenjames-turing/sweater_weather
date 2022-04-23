class CurrentWeather
  include DateFormatter

  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like,
              :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(weather_data)
    @datetime = date_formatter(weather_data[:dt])
    @sunrise = date_formatter(weather_data[:sunrise])
    @sunset = date_formatter(weather_data[:sunset])
    @temperature = weather_data[:temp]
    @feels_like = weather_data[:feels_like] 
    @humidity = weather_data[:humidity]
    @uvi = weather_data[:uvi]
    @visibility = weather_data[:visibility]
    @conditions = weather_data[:weather][0][:description]
    @icon = weather_data[:weather][0][:icon]
  end
end 