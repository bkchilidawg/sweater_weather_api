class Munchies
  attr_reader :restaurant, :forecast, :destination

  def initialize(restaurant_data, forecast_data, location_data)
    @restaurant = restaurant_data
    @forecast = forecast_data
    @destination = location_data_format(location_data)
  end

  def id
    nil
  end

  def location_data_format(location_data)
    city_state = location_data.split(",") 
    "#{city_state[0].capitalize}, #{city_state[1].upcase}"
  end
end