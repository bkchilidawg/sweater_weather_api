class DirectionsService
  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2/")
  end

  def self.get_travel_time(origin, destination)
    response = conn.get("route?key=#{Rails.application.credentials.mapquest_api[:key]}&from=#{origin}&to=#{destination}")
    json_response = JSON.parse(response.body, symbolize_names: true)
    parsed = JSON.parse(response.body, symbolize_names: true)
    {travel_time: parsed[:route][:formattedTime], unix: parsed[:route][:realTime]}
  end

end
