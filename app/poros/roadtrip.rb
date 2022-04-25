class Roadtrip 
  include DateTimeFormatter

    attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

    def initialize(start_city, destination, travel_time, weather_data) 
        @id = 'null'
        @start_city = start_city
        @end_city = destination
        @travel_time = travel_time != 'impossible route' ? time_formatter(travel_time) : travel_time
        @weather_at_eta = format_weather(weather_data)
    end

    def format_weather(weather_data)
      if @travel_time == 'impossible route'
        forecast = {}
      else 
        forecast = {
                      "temperature": weather_data.temperature,
                      "conditions": weather_data.conditions
                    }
      end
    end
end