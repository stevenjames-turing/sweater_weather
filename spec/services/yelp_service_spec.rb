require 'rails_helper'

RSpec.describe YelpService, :vcr do
  context 'class methods' do 
    context '#business_search(latitude, longitude, term)' do
      before(:each) do 
        @yelp_data = YelpService.business_search(38.630276, -90.200309, 'tacos')
      end

      it 'accepts authorization token' do 
        expect(@yelp_data.has_key?(:error)).to be false
      end

      it 'returns a hash of restaurant data' do 
        expect(@yelp_data).to be_a Hash
      end
    end
  end
end