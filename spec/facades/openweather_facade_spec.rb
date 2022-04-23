require 'rails_helper'

RSpec.describe OpenweatherFacade do
  context 'class methods' do 
    context '#daily_weather(latitude, longitude)' do
      before(:each) do 
        @daily = OpenweatherFacade.daily_weather(38.6270, -90.1994)
      end

      it 'creates array of DailyWeather objects' do 
        expect(@daily).to be_an Array
      end

      
    end
  end
end