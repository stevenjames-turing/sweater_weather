class Api::V1::MunchiesController < ApplicationController

  def index
    # Check for all required params
    if (params[:start].blank?) || (params[:destination].blank?) || (params[:food].blank?)
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else
      # Create object with all above data points for easy serialization of data
      munchie = Munchie.new(params[:start], params[:destination], params[:food])

      json_response(MunchiesSerializer.new(munchie))
    end
  end
end