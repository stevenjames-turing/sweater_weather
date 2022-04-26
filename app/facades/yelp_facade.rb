class YelpFacade

  def self.business_search(location, term)
    json = YelpService.business_search(location, term)

    Restaurant.new(json[:businesses].first)
  end
end