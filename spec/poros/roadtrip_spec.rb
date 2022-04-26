require 'rails_helper'

RSpec.describe Roadtrip, :vcr do 

  before(:each) do 
    @start_location = 'st. louis, mo'
    @destination = 'denver, co'
    @impossible_route = 'london, UK'
  end

  it 'will create a Roadtrip object' do 
    roadtrip = Roadtrip.new(@start_location, @destination)

    expect(roadtrip).to be_a Roadtrip
  end
  
  it 'has all required attributes' do 
    roadtrip = Roadtrip.new(@start_location, @destination)

    expect(roadtrip.id).to eq('null')
    expect(roadtrip.start_city).to eq('st. louis, mo')
    expect(roadtrip.end_city).to eq('denver, co')
    expect(roadtrip.travel_time).to_not eq('impossible route')
    expect(roadtrip.weather_at_eta.keys).to eq([:temperature, :conditions])
  end
  
  it 'returns an empty hash of weather data if route is not possible' do 
    roadtrip = Roadtrip.new(@start_location, @impossible_route)
    
    expect(roadtrip.id).to eq('null')
    expect(roadtrip.start_city).to eq('st. louis, mo')
    expect(roadtrip.end_city).to eq('london, UK')
    expect(roadtrip.travel_time).to eq("impossible route")
    expect(roadtrip.weather_at_eta).to eq({})
  end
  
  it 'returns weather at the 48th hour if travel time is longer than 48 hours' do 
    roadtrip = Roadtrip.new('anchorage, ak', 'miami, fl')
    
    expect(roadtrip.id).to eq('null')
    expect(roadtrip.start_city).to eq('anchorage, ak')
    expect(roadtrip.end_city).to eq('miami, fl')
    expect(roadtrip.travel_time).to_not eq("impossible route")
    expect(roadtrip.weather_at_eta.keys).to eq([:temperature, :conditions])
  end

end