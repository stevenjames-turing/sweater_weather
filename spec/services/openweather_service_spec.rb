require 'rails_helper'

RSpec.describe OpenweatherService, :vcr do
  context 'class methods' do 
    context '#all_weather(latitude, longitude)' do
      before(:each) do 
        @weather_data = OpenweatherService.all_weather(38.6270, -90.1994)
      end

      it 'returns a hash of weather data' do 
        expect(@weather_data).to be_a Hash
      end

      it 'hash has expected data' do 
        expect(@weather_data.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
      end
      
      it 'hash does NOT have unexpected data' do 
        expect(@weather_data.keys).to_not include('minutely')
        expect(@weather_data.keys).to_not include('alerts')
      end

      it 'data is formatted as expected' do 
        expect(@weather_data[:lat]).to be_a Float
        expect(@weather_data[:lat]).to eq(38.6270)

        expect(@weather_data[:lon]).to be_a Float
        expect(@weather_data[:lon]).to eq(-90.1994)

        expect(@weather_data[:timezone]).to be_a String
        expect(@weather_data[:timezone]).to eq("America/Chicago")

        expect(@weather_data[:timezone_offset]).to be_a Integer
        expect(@weather_data[:timezone_offset]).to eq(-18000)
        
        expect(@weather_data[:current]).to be_a Hash

        expect(@weather_data[:hourly]).to be_an Array

        expect(@weather_data[:daily]).to be_an Array
      end

      it 'current includes expected data' do 
        expected_keys = [:dt, :sunrise, :sunset, :temp, :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :wind_gust, :weather]
        expect(@weather_data[:current].keys).to eq(expected_keys)
      end
      
      it 'hourly includes expected data' do 
        expect(@weather_data[:hourly].count).to eq(48)
        
        expected_keys = [:dt, :temp, :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :wind_gust, :weather, :pop]
        expect(@weather_data[:hourly][0].keys).to eq(expected_keys)
      end
      
      it 'daily includes expected data' do 
        expect(@weather_data[:daily].count).to eq(8)
        
        expected_keys = [:dt, :sunrise, :sunset, :moonrise, :moonset, :moon_phase, :temp, :feels_like, :pressure, :humidity, :dew_point, :wind_speed, :wind_deg, :wind_gust, :weather, :clouds, :pop, :uvi]
        expect(@weather_data[:daily][0].keys).to eq(expected_keys)
      end
    end
  end
end