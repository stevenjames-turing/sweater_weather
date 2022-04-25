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

      it 'attributes does NOT contain password' do 
        post '/api/v1/sessions', :params => @request_body

        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.has_key?(:password)).to be false 
        expect(attributes.has_key?(:password_digest)).to be false 
        expect(attributes.has_key?(:password_confirmation)).to be false 
      end
    end

    context 'password does not match' do 
      before(:each) do 
        User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
        @bad_pass = {
                          "session": {
                                      "email": 'test_email@test.com', 
                                      "password": '123passtest'
                                      }
                        }
      end

      it 'returns a 401 error code' do 
        post '/api/v1/sessions', :params => @bad_pass

        expect(response).to have_http_status(401)
      end

      it 'returns an error message' do 
        post '/api/v1/sessions', :params => @bad_pass

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"invalid credentials"})  
      end
    end

    context 'email does not match any users' do 
      before(:each) do 
        User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
        @bad_email = {
                          "session": {
                                      "email": 'wrong_email@test.com', 
                                      "password": 'password123'
                                      }
                        }
      end

      it 'returns a 401 error code' do 
        post '/api/v1/sessions', :params => @bad_email

        expect(response).to have_http_status(401)
      end

      it 'returns an error message' do 
        post '/api/v1/sessions', :params => @bad_email

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"invalid credentials"})  
      end
    end

    context 'email and password incorrect' do 
      before(:each) do 
        User.create!(email: 'test_email@test.com', password: 'password123', password_confirmation: 'password123')
        @incorrect = {
                          "session": {
                                      "email": 'wrong_email@test.com', 
                                      "password": '123passtest'
                                      }
                        }
      end

      it 'returns a 401 error code' do 
        post '/api/v1/sessions', :params => @incorrect

        expect(response).to have_http_status(401)
      end

      it 'returns an error message' do 
        post '/api/v1/sessions', :params => @incorrect

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:error]).to eq({:message=>"invalid credentials"})  
      end
    end
  end 
end 