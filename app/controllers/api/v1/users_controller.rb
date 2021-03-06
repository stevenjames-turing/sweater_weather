class Api::V1::UsersController < ApplicationController

  def create
    # Checks to ensure data was passed through body and not through URL
    # Returns error message if data was passed through URL
    if params[:user].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    else
      # Validity tests completed next. Error messages different if mismatched passwords or email already registered
      if !valid_pass
        json_response({ "error": {"message" => 'passwords do not match'} }, :bad_request)
      elsif User.find_by_email(params[:user][:email])
        json_response({ "error": {"message" => 'email has already been taken'} }, :bad_request)
      else
        # If data passes all checks, user is created and response is sent with 201 status code
        user = User.create!(email: params[:user][:email], 
                            password: params[:password],
                            password_confirmation: params[:password_confirmation])

        json_response(UserSerializer.new(user), :created)
      end
    end 
  end

  private 

    def valid_pass
      true if params[:password] == params[:password_confirmation]
    end

end
