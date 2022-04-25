class Api::V1::RoadTripController < ApplicationController

  def create
    # Checks to ensure data was passed through body and not through URL
    # Returns error message if data was passed through URL
    if params[:road_trip].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    elsif (params[:road_trip][:origin].blank?) || (params[:road_trip][:destination].blank?) || (params[:road_trip][:api_key].blank?)
      json_response({ "error": {"message" => 'required parameters are missing or empty'} }, :bad_request)
    else 
      # If data was given in body, authentication checks occur
      # Checking API key against User database
      user = User.find_by(api_key: params[:road_trip][:api_key])
      if user
        get_destination_coordinates(params[:road_trip][:destination])
        get_route(params[:road_trip][:origin], params[:road_trip][:destination])
        get_current_conditions(@destination_coordinates[:lat], @destination_coordinates[:lng])

        roadtrip = Roadtrip.new(params[:road_trip][:origin], params[:road_trip][:destination], @travel_time, @current_conditions)
        
        # Serialized JSON response if all authentication checks pass
        json_response(RoadtripSerializer.new(roadtrip))
      else 
        # Error message is the same if email or password fail validations
        json_response({ "error": {"message" => 'invalid credentials'} }, :unauthorized)
      end
    end 
  end

  private 

    def get_route(start, destination)
      directions = MapquestService.directions(start, destination)
      if directions[:info][:statuscode] == 402
        @travel_time = 'impossible route'
      else 
        @travel_time = directions[:route][:formattedTime]
      end
    end

    def get_destination_coordinates(location)
      @destination_coordinates = MapquestService.get_city_coordinates(location)
    end
    
    def get_current_conditions(latitude, longitude)
      @current_conditions = OpenweatherFacade.current_weather(latitude, longitude)
    end

end