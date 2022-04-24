class MapquestService

  def self.conn 
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
    end
  end

  def self.get_city_coordinates(city)
    response = conn.get('address') do |request|
      request.params['location'] = city
      request.params['outFormat'] = 'json'
    end
    json = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

end