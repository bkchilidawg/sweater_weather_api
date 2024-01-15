class MunchiesService 
  def self.conn 
    Faraday.new(url: "https://api.yelp.com/v3/") do |faraday|
      api_key = Rails.application.credentials.dig(:yelp, :api_key)

      faraday.headers["Authorization"] = "Bearer #{api_key}"
    end
  end
  
  def self.get_restaurant(type, lat, lon)
    response = conn.get("businesses/search", { term: type, latitude: lat, longitude: lon })
    data = JSON.parse(response.body, symbolize_names: true)
    

    if data[:businesses].present?
      restaurant = data[:businesses].sample
      hash = {
        name: restaurant[:name], 
        address: restaurant[:location][:display_address].join(" "),
        rating: restaurant[:rating].to_f, 
        reviews: restaurant[:review_count]
      }
    else
     
      hash = {
        name: "No restaurants found",
        address: "",
        rating: 0.0,
        reviews: 0
      }
    end
  end
end
