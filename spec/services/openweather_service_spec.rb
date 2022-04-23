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
    end
  end
end