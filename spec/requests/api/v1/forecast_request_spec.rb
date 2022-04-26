require 'rails_helper'

describe 'Forecast API', :vcr do
  
  context 'forecast#index' do
    
    context 'happy path' do 
      it 'has a successful response' do 
        get '/api/v1/forecast?location=denver, co'
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      
      it 'returns a json of expected data' do 
        get '/api/v1/forecast?location=denver, co'
        data = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(data.keys).to eq([:id, :type, :attributes])
      end
      
      it 'attributes contain current, daily, and hourly weather data' do 
        get '/api/v1/forecast?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
        
        expect(attributes.keys).to eq([:current_weather, :daily_weather, :hourly_weather])
      end
      
      it 'current weather has required data points' do 
        get '/api/v1/forecast?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
        
        expect(attributes[:current_weather].keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])

        expect(attributes[:current_weather][:datetime]).to be_a String
        expect(attributes[:current_weather][:sunrise]).to be_a String
        expect(attributes[:current_weather][:sunset]).to be_a String
        expect(attributes[:current_weather][:temperature]).to be_a(Float) | be_an(Integer)
        expect(attributes[:current_weather][:feels_like]).to be_a(Float) | be_an(Integer)
        expect(attributes[:current_weather][:humidity]).to be_a(Float) | be_an(Integer)
        expect(attributes[:current_weather][:uvi]).to be_a(Float) | be_an(Integer)
        expect(attributes[:current_weather][:visibility]).to be_a(Float) | be_an(Integer)
        expect(attributes[:current_weather][:conditions]).to be_a String
        expect(attributes[:current_weather][:icon]).to be_a String
      end

      it 'daily weather has required data points' do 
        get '/api/v1/forecast?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        attributes[:daily_weather][0].each do |day|
          expect(day.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])

          expect(day[:date]).to be_a String
          expect(day[:sunrise]).to be_a String
          expect(day[:sunset]).to be_a String
          expect(day[:max_temp]).to be_a Float
          expect(day[:min_temp]).to be_a Float
          expect(day[:conditions]).to be_a String
          expect(day[:icon]).to be_a String
        end
      end

      it 'hourly weather has required data points' do 
        get '/api/v1/forecast?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        attributes[:hourly_weather][0].each do |hour|
          expect(hour.keys).to eq([:time, :temperature, :conditions, :icon])

          expect(hour[:time]).to be_a String
          expect(hour[:temperature]).to be_a Float
          expect(hour[:conditions]).to be_a String
          expect(hour[:icon]).to be_a String
        end
      end
    end

    context 'location param is empty' do 

      it 'returns a 400 error code' do 
        get '/api/v1/forecast?location='
        
        expect(response).to have_http_status(400)
      end
      
      it 'returns error message for invalid parameters' do 
        get '/api/v1/forecast?location='
        expect(response).to have_http_status(400)
        
        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:error]).to eq({:message=>"invalid parameters"})  
      end
    end
    
    context 'location param is missing' do 

      it 'returns a 400 error code' do 
        get '/api/v1/forecast?'
        
        expect(response).to have_http_status(400)
      end
      
      it 'returns error message for invalid parameters' do 
        get '/api/v1/forecast?'
        expect(response).to have_http_status(400)
        
        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:error]).to eq({:message=>"invalid parameters"})  
      end
    end
  end
end
