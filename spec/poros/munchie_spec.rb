require 'rails_helper'

RSpec.describe Munchie do 

  before(:each) do 
    @destination = 'denver, co'
    weather_data = {
                      "dt": 1650747631,
                      "sunrise": 1650712400,
                      "sunset": 1650761070,
                      "temp": 84.09,
                      "feels_like": 83.08,
                      "pressure": 1011,
                      "humidity": 38,
                      "dew_point": 55.76,
                      "uvi": 0,
                      "clouds": 62,
                      "visibility": 10000,
                      "wind_speed": 19.95,
                      "wind_deg": 179,
                      "wind_gust": 35.46,
                      "weather": [
                                    {
                                      "id": 803,
                                      "main": "Clouds",
                                      "description": "broken clouds",
                                      "icon": "04d"
                                    }
                                  ]
                    }
    @current_weather = CurrentWeather.new(weather_data)
    @travel_time = "01:45:23"
    restaurant_data = {
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

    @restaurant = Restaurant.new(restaurant_data)
  end

  it 'will create a Munchie object' do 
    munchie = Munchie.new(@destination, @current_weather, @travel_time, @restaurant)

    expect(munchie).to be_a Munchie
  end
  
  it 'has all required attributes' do 
    munchie = Munchie.new(@destination, @current_weather, @travel_time, @restaurant)

    expect(munchie.id).to eq('null')
    expect(munchie.destination_city).to eq('denver, co')
    expect(munchie.travel_time).to eq("01:45:23")
    expect(munchie.forecast).to eq({
                                    "summary": "broken clouds",
                                    "temperature": 84.09
                                  })
    expect(munchie.restaurant).to eq({
                                    "name": "BLT's - Breakfast, Lunch and Tacos",
                                    "address": "626 N 6th St St. Louis, MO 63101"
                                  })
  end
end



