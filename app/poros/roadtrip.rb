class Roadtrip 
  include DateTimeFormatter

  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start_location, destination) 
      @id = 'null'
      @start_city = start_location
      @end_city = destination
      @travel_time = calculate_travel_time(start_location, destination)
      @weather_at_eta = destination_weather_at_eta(destination)
  end

  def calculate_travel_time(start_location, destination)
    directions = MapquestService.directions(start_city, destination)

    directions[:info][:statuscode] != 402 ? directions[:route][:formattedTime] : 'impossible route'
  end

  def destination_weather_at_eta(destination)
    if @travel_time != 'impossible route'
      hours_to_eta = @travel_time.split(":")[0].to_i

      if hours_to_eta <= 49
        weather_at_eta = OpenweatherFacade.weather_forecast(destination, 'hourly')[hours_to_eta - 1]
      else
        weather_at_eta = OpenweatherFacade.weather_forecast(destination, 'hourly')[-1]
      end

      forecast = {
                    "temperature": weather_at_eta.temperature,
                    "conditions": weather_at_eta.conditions
                  }
    else 
      forecast = {}
    end
    return forecast
  end
end
