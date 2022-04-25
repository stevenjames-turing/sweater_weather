class Api::V1::MunchiesController < ApplicationController

  def index
    # Check for all required params
    if (params[:start].blank?) || (params[:destination].blank?) || (params[:food].blank?)
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else
      # Gets destination coordinates for weather conditions and restaraunt search
      get_destination_coordinates(params[:destination])
      # Gets restaurant using food param and destination coordinates
      get_restaurant(params[:food])
      # Gets route data from Mapquest Service
      get_route(params[:start], params[:destination])
      # Returns current weather conditions in destination city
      get_current_conditions(@destination_coordinates[:lat], @destination_coordinates[:lng])
      # Create object with all above data points for easy serialization of data
      munchie = Munchie.new(params[:destination], @current_conditions, @travel_time, @restaurant)
      # If request has all params, return serialized Munchie data
      json_response(MunchiesSerializer.new(munchie))
    end
  end

  private 

    def get_restaurant(food_type)
      @restaurant = YelpFacade.business_search(@destination_coordinates[:lat], @destination_coordinates[:lng], food_type)
    end

    def get_destination_coordinates(location)
      @destination_coordinates = MapquestService.get_city_coordinates(location)
    end

    def get_current_conditions(latitude, longitude)
      @current_conditions = OpenweatherFacade.current_weather(latitude, longitude)
    end

    def get_route(start, destination)
      @travel_time = MapquestService.directions(start, destination)[:route][:formattedTime]
    end
end