require 'rails_helper'

describe 'RoadTrip Endpoint', :vcr do
  
  context 'road_trip#create' do

    context 'happy path' do 
      before(:each) do 
        user = User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
        @request_body = {
                          "road_trip": {
                                        "origin": "Denver,CO",
                                        "destination": "Pueblo,CO",
                                        "api_key": "#{user.api_key}"
                                        }
                        }
      end
      
      it 'has a successful created response' do 
        post '/api/v1/road_trip', :params => @request_body
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      
      it 'returns a json of expected data' do 
        post '/api/v1/road_trip', :params => @request_body
        
        data = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(data.keys).to eq([:id, :type, :attributes])
      end
      
      it 'attributes contains start_city, end_city, travel_time, and weather_at_eta' do 
        post '/api/v1/road_trip', :params => @request_body

        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
      end

    #   it 'attributes does NOT contain password' do 
    #     post '/api/v1/road_trip', :params => @request_body

    #     attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    #     expect(attributes.has_key?(:password)).to be false 
    #     expect(attributes.has_key?(:password_digest)).to be false 
    #     expect(attributes.has_key?(:password_confirmation)).to be false 
    #   end
    end

    context 'params are passed through URL' do 
      before(:each) do 
        @user = User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
      end

      it 'returns a 401 error code' do 
        post "/api/v1/road_trip?origin=Denver,CO&destination=Pueblo,CO&api_key=#{@user.api_key}"

        expect(response).to have_http_status(400)
      end

      it 'returns an error message' do 
        post "/api/v1/road_trip?origin=Denver,CO&destination=Pueblo,CO&api_key=#{@user.api_key}"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"missing request body"})  
      end
    end
  end 
end 