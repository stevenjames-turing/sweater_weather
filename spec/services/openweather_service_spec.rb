require 'rails_helper'

RSpec.describe OpenweatherService do
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
    end
  end
end