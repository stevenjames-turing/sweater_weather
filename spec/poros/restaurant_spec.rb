require 'rails_helper'

RSpec.describe Restaurant do 

  before(:each) do 
    @restaurant_data = {
                    "id": "1yrGx3Cwtj7I0zmhuVsu9Q",
                    "alias": "blts-breakfast-lunch-and-tacos-st-louis",
                    "name": "BLT's - Breakfast, Lunch and Tacos",
                    "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/i-fRG8nTlAYzuNA_uMQoCA/o.jpg",
                    "is_closed": false,
                    "url": "https://www.yelp.com/biz/blts-breakfast-lunch-and-tacos-st-louis?adjust_creative=HpJeyNvw52L4ND8Cc3A7JA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=HpJeyNvw52L4ND8Cc3A7JA",
                    "review_count": 265,
                    "categories": [
                        {
                            "alias": "breakfast_brunch",
                            "title": "Breakfast & Brunch"
                        },
                        {
                            "alias": "tacos",
                            "title": "Tacos"
                        },
                        {
                            "alias": "venues",
                            "title": "Venues & Event Spaces"
                        }
                    ],
                    "rating": 4.0,
                    "coordinates": {
                        "latitude": 38.6304229,
                        "longitude": -90.1890618
                    },
                    "transactions": [
                        "pickup",
                        "delivery"
                    ],
                    "price": "$$",
                    "location": {
                        "address1": "626 N 6th St",
                        "address2": "null",
                        "address3": "null",
                        "city": "St. Louis",
                        "zip_code": "63101",
                        "country": "US",
                        "state": "MO",
                        "display_address": [
                            "626 N 6th St",
                            "St. Louis, MO 63101"
                        ]
                    },
                    "phone": "+13149258505",
                    "display_phone": "(314) 925-8505",
                    "distance": 1004.7449281621678
                }
  end

  it 'will create a Restaurant object' do 
    restaurant = Restaurant.new(@restaurant_data)

    expect(restaurant).to be_a Restaurant
  end
  
  it 'has all required attributes' do 
    restaurant = Restaurant.new(@restaurant_data)

    expect(restaurant.id).to eq('null')
    expect(restaurant.name).to eq("BLT's - Breakfast, Lunch and Tacos")
    expect(restaurant.address).to eq('626 N 6th St St. Louis, MO 63101')
  end
end



