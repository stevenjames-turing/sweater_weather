class Api::V1::BackgroundsController < ApplicationController

  def index
    # Checks to ensure param is not missing or empty string
    if params[:location].blank?
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else
      # Private methods will return weather conditions and matching photo for location
      get_current_conditions(params[:location])
      photo_search(params[:location], @current_conditions.conditions)

      json_response(PhotoSerializer.new(@photo).serializable_hash.to_json)
    end
  end

  private 

    def get_current_conditions(location)
      @current_conditions = OpenweatherFacade.weather_forecast(location, "current")
    end

    def photo_search(location, conditions)
      @photo = UnsplashFacade.photo_search(location, conditions)
    end
end