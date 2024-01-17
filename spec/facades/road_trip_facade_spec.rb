require 'spec_helper'

RSpec.describe RoadTripFacade do
  describe '.get_road_trip' do
    context 'when travel time is possible' do
      let(:origin) { 'New York, NY' }
      let(:destination) { 'Los Angeles, CA' }
      let(:coordinates_hash) { { latitude: 34.0522, longitude: -118.2437 } }
      let(:directions_data) { { travel_time: '5 hours', unix: 18000 } }
      let(:weather_data) { { temperature: 75, conditions: 'Sunny' } }

      before do
        allow(GeocodingService).to receive(:get_coordinates).with(destination).and_return(coordinates_hash)
        allow(DirectionsService).to receive(:get_travel_time).with(origin, destination).and_return(directions_data)
        allow(ForecastService).to receive(:get_forecast).with(coordinates_hash[:latitude], coordinates_hash[:longitude]).and_return(weather_data)
      end

      it 'returns a RoadTrip object with correct data' do
        road_trip = RoadTripFacade.get_road_trip(origin, destination)

        expect(road_trip.start_city).to eq('New York, NY')
        expect(road_trip.end_city).to eq('Los Angeles, CA')
        expect(road_trip.travel_time).to eq('5 hours')
        expect(road_trip.weather_at_eta).to eq(weather_data)
      end
    end

    context 'when travel time is impossible' do
      let(:origin) { 'New York, NY' }
      let(:destination) { 'London, UK' }
      let(:directions_data) { { travel_time: nil } }

      before do
        allow(GeocodingService).to receive(:get_coordinates).with(destination).and_return({})
        allow(DirectionsService).to receive(:get_travel_time).with(origin, destination).and_return(directions_data)
      end

      it 'returns a RoadTrip object with empty weather data' do
        road_trip = RoadTripFacade.get_road_trip(origin, destination)

        expect(road_trip.start_city).to eq('New York, NY')
        expect(road_trip.end_city).to eq('London, UK')
        expect(road_trip.travel_time).to eq('impossible')
        expect(road_trip.weather_at_eta).to eq({})
      end
    end
  end
end
