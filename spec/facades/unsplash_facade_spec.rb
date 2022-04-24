require 'rails_helper'

RSpec.describe UnsplashFacade, :vcr do
  context 'class methods' do 
    context '#photo_search(query)' do
      before(:each) do 
        location = 'denver, co'
        current_weather_condition = 'scattered clouds'
        @photo = UnsplashFacade.photo_search(location, current_weather_condition)
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