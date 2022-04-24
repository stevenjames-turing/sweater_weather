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
