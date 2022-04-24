class UnsplashFacade

  def self.photo_search(query)
    json = UnsplashService.photo_search(query)

    Photo.new(json[:results][0])
  end
end