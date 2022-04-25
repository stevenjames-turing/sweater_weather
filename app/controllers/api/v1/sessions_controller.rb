class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      json_response(UserSerializer.new(user))
    else 
      json_response({ "error": {"message" => 'invalid credentials'} }, :unauthorized)
    end
  end

end
