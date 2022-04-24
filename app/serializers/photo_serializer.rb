class PhotoSerializer
  include JSONAPI::Serializer
  attributes :source, :image_url, :photographer, :photographer_profile
end
