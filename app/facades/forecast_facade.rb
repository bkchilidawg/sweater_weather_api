class ForecastFacade
  def self.get_forecast(city_state)
    coordinates_hash = GeocodingService.get_coordinates(city_state)
    forecast_data = ForecastService.get_forecast(coordinates_hash[:latitude], coordinates_hash[:longitude])
    Forecast.new(forecast_data)
  end

end