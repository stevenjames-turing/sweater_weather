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

      it 'each object has expected attributes' do 
        @daily.each do |day_object|
          expect(day_object.date).to be_a String
          expect(day_object.sunrise).to be_a Time
          expect(day_object.sunset).to be_a Time
          expect(day_object.max_temp).to be_a Float
          expect(day_object.min_temp).to be_a Float
          expect(day_object.conditions).to be_a String
          expect(day_object.icon).to be_a String
        end
      end
    end
  end
end