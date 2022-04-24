require 'rails_helper'

RSpec.describe UnsplashFacade, :vcr do
  context 'class methods' do 
    context '#photo_search(query)' do
      before(:each) do 
        @photo = UnsplashFacade.photo_search('denver colorado cloudy')
      end

      it 'creates a Photo object' do 
        expect(@photo).to be_an Photo
      end

      
    end
  end
end