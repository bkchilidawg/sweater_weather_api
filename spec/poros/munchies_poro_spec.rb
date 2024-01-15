require 'rails_helper'

RSpec.describe Munchies do
  it 'object has all attributes', :vcr do
    coordinates_hash = GeocodingService.get_coordinates("Oklahoma city, OK")
    restaurant_data = MunchiesService.get_restaurant("mexican", coordinates_hash[:latitude], coordinates_hash[:longitude])
    forecast_data = ForecastService.get_munchies_forecast(coordinates_hash[:latitude], coordinates_hash[:longitude])
    munchies = Munchies.new(restaurant_data, forecast_data, "Oklahoma city,  OK")

    expect(munchies).to be_a Munchies

    expect(munchies.destination).to eq("Oklahoma city,   OK")
    expect(munchies.forecast).to be_a Hash
    expect(munchies.forecast.keys).to eq([:temperature, :condition])
    expect(munchies.forecast[:temperature]).to be_a Float
    expect(munchies.forecast[:condition]).to be_a String
    expect(munchies.restaurant).to be_a Hash
    expect(munchies.restaurant.keys).to eq([:name, :address, :rating, :reviews])
    expect(munchies.restaurant[:name]).to be_a String
    expect(munchies.restaurant[:address]).to be_a String
    expect(munchies.restaurant[:rating]).to be_a Float
    expect(munchies.restaurant[:reviews]).to be_a Integer

  end
end