require 'rails_helper'

RSpec.describe RoadTripSerializer do
  let(:start_city) { 'New York' }
  let(:end_city) { 'Los Angeles' }
  let(:travel_time) { '5 hours' }
  let(:weather_at_eta) { { max_temp: 75, conditions: 'Sunny' } }

  it 'serializes the road trip attributes' do
    road_trip = RoadTrip.new(start_city: start_city, end_city: end_city, travel_time: travel_time, weather_at_eta: weather_at_eta)
    serializer = RoadTripSerializer.new(road_trip)
    serialized_road_trip = serializer.as_json

    expect(serialized_road_trip['data']['attributes']).to include(
      "start_city" => start_city,
      "end_city" => end_city,
      "travel_time" => travel_time,
    )
  end
end
