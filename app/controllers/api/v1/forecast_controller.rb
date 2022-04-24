class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location].blank?
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else 
      get_coordinates(params[:location])
      get_weather_forecasts(@coordinates[:lat], @coordinates[:lng])
      json_response(ForecastSerializer.weather_forecasts(@current_weather, @hourly_weather, @daily_weather))
    end


  end

  private 

    def get_coordinates(location)
      @coordinates = MapquestService.get_city_coordinates(location)
    end

    def get_weather_forecasts(latitude, longitude)
      @current_weather = OpenweatherFacade.current_weather(latitude, longitude)
      @hourly_weather = OpenweatherFacade.hourly_weather(latitude, longitude)
      @daily_weather = OpenweatherFacade.daily_weather(latitude, longitude)

      # @weather_forecasts = {
      #                         current: current_weather,
      #                         hourly: hourly_weather,
      #                         daily: daily_weather
      #                       }
    end
end