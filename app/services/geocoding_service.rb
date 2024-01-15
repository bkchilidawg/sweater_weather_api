class GeocodingService
  def self.get_coordinates(city_state)
    response = conn.get("address?key=#{Rails.application.credentials.mapquest_api[:key]}&location=#{city_state}")
    hash = JSON.parse(response.body, symbolize_names: true)
    coordinates = hash[:results].first[:locations].first[:latLng]
    { latitude: coordinates[:lat], longitude: coordinates[:lng] } if coordinates
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/")
  end
end