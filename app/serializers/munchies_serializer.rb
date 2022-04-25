class MunchiesSerializer
  include JSONAPI::Serializer
  attributes :destination_city, :travel_time, :forecast, :restaurant
end
