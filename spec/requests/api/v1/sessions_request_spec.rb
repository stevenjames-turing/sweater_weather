require 'rails_helper'

describe 'Sessions Endpoint', :vcr do
  
  context 'sessions#create' do

    context 'happy path' do 
      before(:each) do 
        User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
        @request_body = {
                          "session": {
                                      "email": 'test_email@test.com', 
                                      "password": 'password123'
                                      }
                        }
      end
      
      it 'has a successful created response' do 
        post '/api/v1/sessions', :params => @request_body
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      
      it 'returns a json of expected data' do 
        post '/api/v1/sessions', :params => @request_body
        
        data = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(data.keys).to eq([:id, :type, :attributes])
      end
      
      it 'attributes contains email and api_key' do 
        post '/api/v1/sessions', :params => @request_body

        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.keys).to eq([:email, :api_key])
      end

      
    end
  end 
end 