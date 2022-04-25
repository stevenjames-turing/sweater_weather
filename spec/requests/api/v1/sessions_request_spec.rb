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
      
      
    end
  end 
end 