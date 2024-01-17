require 'spec_helper'

RSpec.describe RoadTrip do
  let(:road_trip_data) do
    {
      start_city: 'New York',
      end_city: 'Los Angeles',
      travel_time: '10 hours',
      weather_at_eta: 'Sunny'
    }
  end

  subject { described_class.new(road_trip_data) }

  it 'has the correct attributes' do
    expect(subject.start_city).to eq('New York')
    expect(subject.end_city).to eq('Los Angeles')
    expect(subject.travel_time).to eq('10 hours')
    expect(subject.weather_at_eta).to eq('Sunny')
  end
end
