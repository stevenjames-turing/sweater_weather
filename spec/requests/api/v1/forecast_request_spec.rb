require 'rails_helper'

describe 'Forecast API', :vcr do
  context 'forecast#index' do
    context 'location param is empty' do 
      it 'returns a 400 error code' do 
        get '/api/v1/forecast?location='
  
        expect(response).to have_http_status(400)
      end

    end
  end
end
