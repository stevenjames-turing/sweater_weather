class Api::V1::ForecastController < ApplicationController

  def index
    # Checks to ensure param is not missing or empty string
    if params[:location].blank?
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else 
      get_weather_forecasts(params[:location])
      json_response(ForecastSerializer.weather_forecasts(@current_weather, @hourly_weather, @daily_weather))
    end
  end

  private 

    def get_weather_forecasts(location)
      @current_weather = OpenweatherFacade.weather_forecast(location, "current")
      @hourly_weather = OpenweatherFacade.weather_forecast(location, "hourly")[0..7]
      @daily_weather = OpenweatherFacade.weather_forecast(location, "daily")
    end
end