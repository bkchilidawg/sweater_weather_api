class MunchiesService 
  def self.conn 
    Faraday.new(url: "https://api.yelp.com/v3/") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp_api[:key]
    end
  end
  
end