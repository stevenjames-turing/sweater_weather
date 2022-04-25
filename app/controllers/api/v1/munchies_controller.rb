class Api::V1::MunchiesController < ApplicationController

  def index
    if (params[:start].blank?) || (params[:destination].blank?) || (params[:food].blank?)
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else 
      get_coordinates('destination', params[:destination])
      get_restaurant(params[:food])
      get_route(params[:start], params[:destination])
      get_current_conditions(@destination_coordinates[:lat], @destination_coordinates[:lng])
      munchie = Munchie.new(params[:destination], @current_conditions, @travel_time, @restaurant)
      json_response(MunchiesSerializer.new(munchie))
    end
  end

  private 

    def get_restaurant(food_type)
      @restaurant = YelpFacade.business_search(@destination_coordinates[:lat], @destination_coordinates[:lng], food_type)
    end

    def get_coordinates(address_type, location)
      if address_type == 'start'
        @starting_coordinates = MapquestService.get_city_coordinates(location)
      elsif address_type == 'destination'
        @destination_coordinates = MapquestService.get_city_coordinates(location)
      end
    end

    def get_current_conditions(latitude, longitude)
      @current_conditions = OpenweatherFacade.current_weather(latitude, longitude)
    end

    def get_route(start, destination)
      @travel_time = MapquestService.directions(start, destination)[:route][:formattedTime]
    end
end