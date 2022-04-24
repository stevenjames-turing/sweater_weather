class UnsplashFacade

  def self.photo_search(location, weather_condition)
    query = "#{location} #{weather_condition}"
    json = UnsplashService.photo_search(query)

    Photo.new(json[:results][0])
  end
end