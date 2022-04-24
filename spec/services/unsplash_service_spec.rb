require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  context 'class methods' do 
    context '#photo_search(query)' do
      before(:each) do 
        @photo_data = UnsplashService.photo_search('st. louis, mo cloudy')
      end

      it 'returns a hash of photo data' do 
        expect(@photo_data).to be_a Hash
      end

      it 'hash has expected data' do 
        expect(@photo_data.keys).to eq([:total, :total_pages, :results])

        expect(@photo_data[:results][0].keys).to eq([:id, :created_at, :updated_at, :promoted_at, :width, :height, 
                                                    :color, :blur_hash, :description, :alt_description, :urls, :links, 
                                                    :categories, :likes, :liked_by_user, :current_user_collections, 
                                                    :sponsorship, :topic_submissions, :user, :tags])
      end
    end
  end
end