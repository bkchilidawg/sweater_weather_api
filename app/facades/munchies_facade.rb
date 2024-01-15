class MunchiesFacade 
  def self.get_munchies(location, type)
    coordinates = GeocodingService.get_coordinates(location)
    if coordinates
      restaurant = MunchiesService.get_restaurant(type, coordinates[:latitude], coordinates[:longitude])
      forecast = ForecastService.get_munchies_forecast(coordinates[:latitude], coordinates[:longitude])
      Munchies.new(restaurant, forecast, location)
    else
      Munchies.new(nil, nil, location)
    end
  end
end
