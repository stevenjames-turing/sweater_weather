require 'rails_helper'

RSpec.describe OpenweatherFacade, :vcr do
  context 'class methods' do 
    context '#weather_forecast(location, forecast_type)' do

      context 'current weather' do 
        before(:each) do 
          @current = OpenweatherFacade.weather_forecast('denver, co', 'current')
        end
        it 'creates a CurrentWeather object' do 
          expect(@current).to be_a CurrentWeather
        end
        it 'object has expected attributes' do 
          expect(@current.datetime).to be_a Time
          expect(@current.sunrise).to be_a Time
          expect(@current.sunset).to be_a Time
          expect(@current.temperature).to be_a(Float) | be_an(Integer)
          expect(@current.feels_like).to be_a(Float) | be_an(Integer)
          expect(@current.humidity).to be_a(Float) | be_an(Integer)
          expect(@current.uvi).to be_a(Float) | be_an(Integer)
          expect(@current.visibility).to be_a(Float) | be_an(Integer)
          expect(@current.conditions).to be_a String
          expect(@current.icon).to be_a String
        end
      end

      context 'hourly weather' do 
        before(:each) do 
          @hourly = OpenweatherFacade.weather_forecast('denver, co', 'hourly')
        end
        it 'creates array of HourlyWeather objects' do 
          expect(@hourly).to be_an Array
        end
        it 'returns the next 48 hours weather data' do 
          expect(@hourly.count).to eq(48)
        end
        it 'each object has expected attributes' do 
          @hourly.each do |hour_object|
            expect(hour_object.time).to be_a String
            expect(hour_object.temperature).to be_a(Float) | be_an(Integer)
            expect(hour_object.conditions).to be_a String
            expect(hour_object.icon).to be_a String
          end
        end
      end

      context 'daily weather' do 
        before(:each) do 
          @daily = OpenweatherFacade.weather_forecast('denver, co', 'daily')
        end
        it 'creates array of DailyWeather objects' do 
          expect(@daily).to be_an Array
        end
        it 'returns the next 5 days of daily weather data' do 
          expect(@daily.count).to eq(5)
        end
        it 'each object has expected attributes' do 
          @daily.each do |day_object|
            expect(day_object.date).to be_a String
            expect(day_object.sunrise).to be_a Time
            expect(day_object.sunset).to be_a Time
            expect(day_object.max_temp).to be_a(Float) | be_an(Integer)
            expect(day_object.min_temp).to be_a(Float) | be_an(Integer)
            expect(day_object.conditions).to be_a String
            expect(day_object.icon).to be_a String
          end
        end
      end
    end    
  end
end