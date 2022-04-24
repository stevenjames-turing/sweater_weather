require 'rails_helper'

describe 'Users Endpoint', :vcr do
  
  context 'users#create' do

    context 'happy path' do 
      before(:each) do 
        @request_body = {
                          "user": {"email": 'test_email@test.com'},
                          "password": 'password123',
                          "password_confirmation": 'password123'
                        }
      end
      it 'has a successful created response' do 
        post '/api/v1/users', :params => @request_body
        
        expect(response).to be_successful
        expect(response).to have_http_status(201)
      end
      
      it 'returns a json of expected data' do 
        post '/api/v1/users', :params => @request_body

        data = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(data.keys).to eq([:id, :type, :attributes])
      end

    end
  end
end
