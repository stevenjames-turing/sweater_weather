class Munchie 

    attr_reader :id, :destination_city, :travel_time, :forecast, :restaurant

    def initialize(start_location, destination, food_preference) 
        @id = 'null'
        @destination_city = destination
        @travel_time = calculate_travel_time(start_location, destination)
        @forecast = current_weather_conditions(destination)
        @restaurant = restaurant_at_destination(destination, food_preference)
    end

    def calculate_travel_time(start_location, destination)
      MapquestService.directions(start_location, destination)[:route][:formattedTime]
    end

    def restaurant_at_destination(destination, food_preference)
      restaurant = YelpFacade.business_search(destination, food_preference)
      
      return_hash = {
                      "name": restaurant.name,
                      "address": restaurant.address
                    }
    end

    def current_weather_conditions(destination)
      weather = OpenweatherFacade.weather_forecast(destination, "current")

      forecast = {
                  "summary": weather.conditions,
                  "temperature": weather.temperature
                }
    end
end