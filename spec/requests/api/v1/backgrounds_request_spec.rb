require 'rails_helper'

describe 'Backgrounds API', :vcr do
  
  context 'backgrounds#index' do
    
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
    
    
  end
end