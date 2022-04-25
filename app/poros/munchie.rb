class Munchie 

    attr_reader :id, :destination_city, :travel_time, :forecast, :restaurant

    def initialize(destination, weather_data, travel_time, restaurant) 
        @id = 'null'
        @destination_city = destination
        @travel_time = travel_time
        @forecast = format_forecast(weather_data)
        @restaurant = format_restaurant(restaurant)
    end

    def format_forecast(weather_data)
      forecast = {
        "summary": weather_data.conditions,
        "temperature": weather_data.temperature
      }
    end

    def format_restaurant(restaurant_data)
      restaurant = {
        "name": restaurant_data.name,
        "address": restaurant_data.address
      }
    end
end