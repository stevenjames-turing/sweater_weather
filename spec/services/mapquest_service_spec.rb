require 'rails_helper'

RSpec.describe MapquestService, :vcr do
  context 'class methods' do 
    context '#get_city_coordinates(city)' do
      before(:each) do 
        @response = MapquestService.get_city_coordinates('St. Louis, MO')
        @location_data = @response[:results][0]
      end

      it 'returns a hash of weather data' do 
        expect(@response).to be_a Hash
      end

      it 'hash has expected data' do 
        expect(@response.keys).to eq([:info, :options, :results])
      end

      it 'results include latitude and longitude' do 
        expect(@location_data[:locations][0][:latLng].keys).to eq([:lat, :lng])
      end

      it 'latitude and longitude are returned as a Float' do 
        expect(@location_data[:locations][0][:latLng][:lat]).to be_a Float
        expect(@location_data[:locations][0][:latLng][:lat]).to eq(38.630276)
        
        expect(@location_data[:locations][0][:latLng][:lng]).to be_a Float
        expect(@location_data[:locations][0][:latLng][:lng]).to eq(-90.200309)
      end
    end
  end
end