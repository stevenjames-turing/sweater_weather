class Api::V1::RoadTripController < ApplicationController

  def create
    # Checks to ensure data was passed through body and not through URL
    # Returns error message if data was passed through URL
    if params[:road_trip].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    # Ensure all params are present in request body
    # Return error if any params are empty string or missing
    elsif (params[:road_trip][:origin].blank?) || (params[:road_trip][:destination].blank?) || (params[:road_trip][:api_key].blank?)
      json_response({ "error": {"message" => 'required parameters are missing or empty'} }, :bad_request)
    else 
      # If data was given in body, authentication checks occur
      # Checking API key against User database
      user = User.find_by(api_key: params[:road_trip][:api_key])
      if user
        roadtrip = Roadtrip.new(params[:road_trip][:origin], params[:road_trip][:destination])
        
        # Serialized JSON response if all authentication checks pass
        json_response(RoadtripSerializer.new(roadtrip))
      else 
        # Error message is the same if email or password fail validations
        json_response({ "error": {"message" => 'invalid credentials'} }, :unauthorized)
      end
    end 
  end
end