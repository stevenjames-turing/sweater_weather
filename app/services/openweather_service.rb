class OpenweatherService 
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/') do |faraday|
      faraday.params['appid'] = ENV['openweather_key']
    end
  end

  def self.all_weather(latitude, longitude)
    response = conn.get('onecall') do |request|
      request.params['lat'] = latitude
      request.params['lon'] = longitude
      request.params['units'] = 'imperial'
      request.params['exclude'] = 'minutely,alerts'
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end