class PitStopService

  def self.conn 
    Faraday.new(url: 'https://api.geoapify.com') do |faraday|
      faraday.params['apiKey'] = ENV['geoapify_key']
    end
  end

  def self.place_of_interest(latitude, longitude)
    response = conn.get('/v2/places') do |request|
      request.params['limit'] = 5
      request.params['filter'] = "circle:#{longitude},#{latitude},50000"
      request.params['bias'] = "proximity:#{longitude},#{latitude}"
      request.params['categories'] = 'tourism'
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
  
end

