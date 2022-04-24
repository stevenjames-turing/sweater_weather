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

      it 'each object has expected attributes' do 
        
        expect(@photo.source).to be_a String
        expect(@photo.image_url).to be_a String
        expect(@photo.photographer).to be_a String
        expect(@photo.photographer_profile).to be_a String
      end
    end
  end
end