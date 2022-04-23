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
    end
  end
end