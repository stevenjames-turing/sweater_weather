class UnsplashService

  def self.conn 
    Faraday.new(url: 'https://api.unsplash.com/') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_key']
    end
  end

  def self.photo_search(query)
    response = conn.get('/search/photos') do |request|
      request.params['query'] = query
      request.params['per_page'] = 1
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

end