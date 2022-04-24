require 'rails_helper'

describe 'Backgrounds API', :vcr do
  
  context 'backgrounds#index' do

    context 'happy path' do 

      it 'has a successful response' do 
        get '/api/v1/backgrounds?location=denver, co'
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      
      it 'returns a json of expected data' do 
        get '/api/v1/backgrounds?location=denver, co'
        data = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(data.keys).to eq([:id, :type, :attributes])
      end
      
      it 'attributes contain source, image_url, photographer name, and profile' do 
        get '/api/v1/backgrounds?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
        
        expect(attributes.keys).to eq([:source, :image_url, :photographer, :photographer_profile])
      end
      
      it 'attributes have the correct format type' do 
        get '/api/v1/backgrounds?location=denver, co'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes[:source]).to be_a String
        expect(attributes[:image_url]).to be_a String
        expect(attributes[:photographer]).to be_a String
        expect(attributes[:photographer_profile]).to be_a String
      end
    end 
    
    context 'location param is empty' do 

      it 'returns a 400 error code' do 
        get '/api/v1/backgrounds?location='
        
        expect(response).to have_http_status(400)
      end
      
      it 'returns error message for invalid parameters' do 
        get '/api/v1/backgrounds?location='
        expect(response).to have_http_status(400)
        
        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:error]).to eq({:message=>"invalid parameters"})  
      end
    end
    
    context 'location param is missing' do 

      it 'returns a 400 error code' do 
        get '/api/v1/backgrounds?'
        
        expect(response).to have_http_status(400)
      end
      
      it 'returns error message for invalid parameters' do 
        get '/api/v1/backgrounds?'
        expect(response).to have_http_status(400)
        
        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:error]).to eq({:message=>"invalid parameters"})  
      end
    end
  end
end
