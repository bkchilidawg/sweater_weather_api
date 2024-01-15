class MunchiesSerializer
  include JSONAPI::Serializer

  attributes  :destination,
              :forecast,
              :restaurant
end
