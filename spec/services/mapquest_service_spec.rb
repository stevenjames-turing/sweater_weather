require 'rails_helper'

RSpec.describe MapquestService, :vcr do
  context 'class methods' do 
    context '#get_city_lat_lon(city)' do
      before(:each) do 
        @response = MapquestService.get_city_lat_lon('St. Louis, MO')
        @location_data = @response[:results]
      end

      it 'returns a hash of weather data' do 
        expect(@response).to be_a Hash
      end

      it 'hash has expected data' do 
        expect(@response.keys).to eq([:info, :options, :results])
      end
    end
  end
end