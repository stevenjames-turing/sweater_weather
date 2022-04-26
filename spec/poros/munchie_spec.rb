require 'rails_helper'

RSpec.describe Munchie, :vcr do 

  before(:each) do 
    @start_location = 'st. louis, mo'
    @destination = 'denver, co'
    @food_preference = 'tacos'
  end

  it 'will create a Munchie object' do 
    munchie = Munchie.new(@start_location, @destination, @food_preference)

    expect(munchie).to be_a Munchie
  end
  
  it 'has all required attributes' do 
    munchie = Munchie.new(@start_location, @destination, @food_preference)

    expect(munchie.id).to eq('null')
    expect(munchie.destination_city).to eq('denver, co')
    expect(munchie.travel_time).to_not be nil 
    expect(munchie.forecast.keys).to eq([:summary, :temperature])
    expect(munchie.restaurant.keys).to eq([:name, :address])
  end
end



