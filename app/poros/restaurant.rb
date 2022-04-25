class Restaurant 

    attr_reader :id, :name, :address

    def initialize(attributes) 
        @id = 'null'
        @name = attributes[:name]
        @street = attributes[:location][:address1]
        @city = attributes[:location][:city]
        @state = attributes[:location][:state]
        @zip = attributes[:location][:zip_code]
        @address = "#{@street} #{@city}, #{@state} #{@zip}"
    end
end