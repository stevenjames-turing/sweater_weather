require 'rails_helper'

RSpec.describe PitStopService, :vcr do
  context 'class methods' do 
    context '#place_of_interest(latitude, longitude)' do
      before(:each) do 
        @places_of_interest = PitStopService.place_of_interest(38.6270, -90.1994)
      end

      it 'returns a hash of location data' do 
        expect(@places_of_interest).to be_a Hash
      end

      it 'returns 5 destinations' do 
        expect(@places_of_interest[:features].count).to eq(5)
      end

      it 'has expected data points' do 
        @places_of_interest[:features].each do |poi|
          expect(poi[:properties].has_key?(:street)).to be true
          expect(poi[:properties].has_key?(:suburb)).to be true
          expect(poi[:properties].has_key?(:city)).to be true
          expect(poi[:properties].has_key?(:state)).to be true
          expect(poi[:properties].has_key?(:country)).to be true
          expect(poi[:properties].has_key?(:country_code)).to be true
          expect(poi[:properties].has_key?(:lon)).to be true
          expect(poi[:properties].has_key?(:lat)).to be true
          expect(poi[:properties].has_key?(:formatted)).to be true
          expect(poi[:properties].has_key?(:address_line1)).to be true
          expect(poi[:properties].has_key?(:address_line2)).to be true
          expect(poi[:properties].has_key?(:categories)).to be true
          expect(poi[:properties].has_key?(:details)).to be true
          expect(poi[:properties].has_key?(:datasource)).to be true
          expect(poi[:properties].has_key?(:distance)).to be true
          expect(poi[:properties].has_key?(:place_id)).to be true
        end
      end
    end
  end
end