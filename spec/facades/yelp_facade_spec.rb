require 'rails_helper'

RSpec.describe YelpFacade, :vcr do
  context 'class methods' do 
    context '#business_search(latitude, longitude, term)' do
      before(:each) do 
        @restaurant = YelpFacade.business_search('st. louis, mo', 'tacos')
      end

      it 'creates a Restaurant object' do 
        expect(@restaurant).to be_a Restaurant
      end

      it 'each object has expected attributes' do 
        expect(@restaurant.id).to eq('null')
        expect(@restaurant.name).to be_a String
        expect(@restaurant.address).to be_a String
      end
    end
  end
end