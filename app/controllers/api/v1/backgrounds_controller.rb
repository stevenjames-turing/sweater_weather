class Api::V1::BackgroundsController < ApplicationController
    def index
    if params[:location].blank?
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else 
      get_coordinates(params[:location])
      get_current_conditions(@coordinates[:lat], @coordinates[:lng])
      photo = UnsplashFacade.photo_search(params[:location], @current_conditions.conditions)
      json_response(PhotoSerializer.new(photo).serializable_hash.to_json)
    end
  end

  private 

    def get_coordinates(location)
      @coordinates = MapquestService.get_city_coordinates(location)
    end

    def get_current_conditions(latitude, longitude)
      @current_conditions = OpenweatherFacade.current_weather(latitude, longitude)
    end
end