require 'rails_helper'

describe 'Munchies API', :vcr do
  
  context 'munchies#index' do

    context 'happy path' do 
      it 'has a successful response' do 
        get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      
      it 'returns a json of expected data' do 
        get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        data = JSON.parse(response.body, symbolize_names: true)[:data]
    
        expect(data.keys).to eq([:id, :type, :attributes])
      end
    end 
  end 
end