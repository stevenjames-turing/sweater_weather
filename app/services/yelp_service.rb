class YelpService

  def self.conn 
    Faraday.new(url: 'https://api.yelp.com/') do |faraday|
    end
  end
  
  def self.business_search(location, term)
    response = conn.get('/v3/businesses/search') do |request|
      request.headers['Authorization'] = "Bearer #{ENV['yelp_key']}"
      request.params['location'] = location
      request.params['term'] = term
      request.params['open_now'] = true 
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end
end

