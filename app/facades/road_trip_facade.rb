class RoadTripFacade
  def self.get_road_trip(origin, destination)
    coordinates_hash = GeocodingService.get_coordinates(destination)
    directions_data = DirectionsService.get_travel_time(origin, destination)

    if directions_data[:travel_time] != nil
      travel_time = directions_data[:travel_time]
      unix_travel_time = directions_data[:unix]
      arrival_time = Time.at(Time.now.to_i + unix_travel_time)
    else
      travel_time = "impossible"
      weather_data = {}
    end
    
    if travel_time == "impossible"
      weather_data = {}
    else
      weather_data = ForecastService.get_forecast(coordinates_hash[:latitude], coordinates_hash[:longitude])
      
    end
    road_trip_data =
      {
      start_city: origin.to_s.gsub(",", ", ").gsub("  ", " "),
      end_city: destination.gsub(",", ", ").gsub("  ", " "),
      travel_time: travel_time,
      weather_at_eta: weather_data
      }
    RoadTrip.new(road_trip_data)
  end
end
