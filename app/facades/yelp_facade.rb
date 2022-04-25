class YelpFacade

  def self.business_search(latitude, longitude, term)
    json = YelpService.business_search(latitude, longitude, term)

    Restaurant.new(json[:businesses].first)
  end
end