class MapquestService

  def self.conn 
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
    end
  end

  def self.get_city_lat_lon(city)
    response = conn.get('address') do |request|
      request.params['location'] = city
      request.params['outFormat'] = 'json'
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

end