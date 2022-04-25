class Api::V1::SessionsController < ApplicationController

  def create
    # Checks to ensure data was passed through body and not through URL
    # Returns error message if data was passed through URL
    if params[:session].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    else 
      # If data was given in body, authentication checks occur
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        # Serialized JSON response if all authentication checks pass
        json_response(UserSerializer.new(user))
      else 
        # Error message is the same if email or password fail validations
        json_response({ "error": {"message" => 'invalid credentials'} }, :unauthorized)
      end
    end 
  end
end
