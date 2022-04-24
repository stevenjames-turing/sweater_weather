class Photo 

    attr_reader :id, :source, :image_url, :photographer, :photographer_profile

    def initialize(photo_data) 
        @id = 'null'
        @source = 'unsplash.com'
        @image_url = photo_data[:urls][:full]
        @photographer = photo_data[:user][:name]
        @photographer_profile = photo_data[:user][:links][:html]+ "?utm_source=Sweater_Weather&utm_medium=referral"
    end
end