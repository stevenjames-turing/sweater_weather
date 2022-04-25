class Api::V1::RoadTripController < ApplicationController

  def create
    # Checks to ensure data was passed through body and not through URL
    # Returns error message if data was passed through URL
    if params[:road_trip].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    else 
      # If data was given in body, authentication checks occur
      # user = User.find_by(api_key: params[:road_trip][:api_key])
      # if user
        # Serialized JSON response if all authentication checks pass
        # json_response(UserSerializer.new(user))
      # else 
        # Error message is the same if email or password fail validations
        # json_response({ "error": {"message" => 'invalid credentials'} }, :unauthorized)
      # end
    end 
  end
end