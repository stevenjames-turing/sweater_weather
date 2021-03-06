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
      
      it 'attributes match expected json contract' do 
        get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes.keys).to eq([:destination_city, :travel_time, :forecast, :restaurant])
      end

      it 'forecast attribute has summary and temperature' do 
        get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

        expect(attributes[:forecast].keys).to eq([:summary, :temperature])
      end
      
      it 'restaurant attributes has name and address' do 
        get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
        attributes = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  
        expect(attributes[:restaurant].keys).to eq([:name, :address])        
      end
    end 

    context 'MISSING params' do 

      context 'start param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?destination=pueblo,co&food=chinese'
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?destination=pueblo,co&food=chinese'
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end

      context 'destination param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?start=denver,co&food=chinese'
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?start=denver,co&food=chinese'
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end

      context 'food param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?start=denver,co&destination=pueblo,co'
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?start=denver,co&destination=pueblo,co'
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end
    end

    context 'EMPTY/BLANK params' do 

     context 'start param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?start=&destination=pueblo,co&food=chinese'
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?start=&destination=pueblo,co&food=chinese'
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end

      context 'destination param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?start=denver,co&destination=&food=chinese'
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?start=denver,co&destination=&food=chinese'
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end

      context 'food param' do 
        it 'returns a 400 error code' do 
          get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food='
          
          expect(response).to have_http_status(400)
        end
        it 'returns error message for invalid parameters' do 
          get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food='
          expect(response).to have_http_status(400)
          
          json = JSON.parse(response.body, symbolize_names: true)
          
          expect(json[:error]).to eq({:message=>"invalid parameters"})  
        end
      end
    end
  end 
end