class Api::V1::UsersController < ApplicationController

  def create
    if params[:user].blank?
      json_response({ "error": {"message" => 'missing request body'} }, :bad_request)
    else
      if !valid_pass
        json_response({ "error": {"message" => 'passwords do no match'} }, :bad_request)
      elsif User.find_by_email(params[:user][:email])
        json_response({ "error": {"message" => 'email has already been taken'} }, :bad_request)
      else
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
