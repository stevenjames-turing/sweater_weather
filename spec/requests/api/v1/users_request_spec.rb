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
      
      it 'attributes contains email and api_key' do 
        post '/api/v1/users', :params => @request_body

        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.keys).to eq([:email, :api_key])
      end

      it 'attributes does NOT contain password' do 
        post '/api/v1/users', :params => @request_body

        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.has_key?(:password)).to be false 
        expect(attributes.has_key?(:password_digest)).to be false 
        expect(attributes.has_key?(:password_confirmation)).to be false 
      end
    end

    context 'password does not match' do 
      before(:each) do 
        @bad_pass = {
                          "user": {"email": 'test_email@test.com'},
                          "password": 'password123',
                          "password_confirmation": 'password'
                        }
      end

      it 'returns a 400 error code' do 
        post '/api/v1/users', :params => @bad_pass

        expect(response).to have_http_status(400)
      end

      it 'returns an error message' do 
        post '/api/v1/users', :params => @bad_pass

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"passwords do not match"})  
      end
    end

    context 'user with email already exists in database' do 
      before(:each) do 
        User.create!(email: 'test_email@test.com', password: 'testpass', password_confirmation: 'testpass')
        @bad_email = {
                          "user": {"email": 'test_email@test.com'},
                          "password": 'password123',
                          "password_confirmation": 'password123'
                        }
      end

      it 'returns a 400 error code' do 
        post '/api/v1/users', :params => @bad_email

        expect(response).to have_http_status(400)
      end

      it 'returns an error message' do 
        post '/api/v1/users', :params => @bad_email

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"email has already been taken"})  
      end
    end

    context 'params are passed through URL' do 
      it 'returns a 400 error code' do 
        post '/api/v1/users?email=person@woohoo.com&password=abc123&password_confirmation=abc123'

        expect(response).to have_http_status(400)
      end

    end
  end
end
