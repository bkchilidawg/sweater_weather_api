class ForecastService
  def self.conn
    Faraday.new(url: "http://api.weatherapi.com/v1/")
  end

  def self.get_forecast(latitude, longitude)
    response = conn.get("forecast.json?key=#{Rails.application.credentials.weather_api[:key]}&q=#{latitude},#{longitude}&days=5")
    hash = JSON.parse(response.body, symbolize_names: true)
    forecast_cleaner(hash)
  end

 def self.forecast_cleaner(full_hash)
    current = full_hash[:current]
    days = full_hash.dig(:forecast, :forecastday)
    return nil unless current && days

    hours = days.first&.dig(:hour)

    clean_hash = {
      current_weather: {
        last_updated: current[:last_updated],
        temperature: current[:temp_f],
        feels_like: current[:feelslike_f],
        humidity: current[:humidity],
        uvi: current[:uv],
        visibility: current[:vis_miles],
        condition: current.dig(:condition, :text),
        icon: current.dig(:condition, :icon)
      },
      daily_weather: days.map do |day|
        d = day[:day]
        astro = day[:astro]
        {
          date: day[:date],
          sunrise: astro&.dig(:sunrise),
          sunset: astro&.dig(:sunset),
          max_temp: d[:maxtemp_f],
          min_temp: d[:mintemp_f],
          condition: d.dig(:condition, :text),
          icon: d.dig(:condition, :icon)
        }
      end,
      hourly_weather: hours&.map do |hour|
        {
          time: hour[:time]&.split(" ")[1],
          temperature: hour[:temp_f],
          conditions: hour.dig(:condition, :text),
          icon: hour.dig(:condition, :icon)
        }
      end
    }
    clean_hash
  end

  def self.get_munchies_forecast(latitude, longitude)
    response = conn.get("forecast.json?key=#{Rails.application.credentials.weather_api[:key]}&q=#{latitude},#{longitude}&days=5")
    hash = JSON.parse(response.body, symbolize_names: true)
    munchies_forecast(hash)
  end

  def self.munchies_forecast(dirty_hash)
    current = dirty_hash[:current]
    clean_hash = {
        temperature: current[:temp_f],
        condition: current[:condition][:text],
      }
  end
end
