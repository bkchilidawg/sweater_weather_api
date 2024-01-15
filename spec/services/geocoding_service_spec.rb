require 'rails_helper'

RSpec.describe 'API call' do
  it 'gets lat and lon data for a given city and state', :vcr do
    location = 'New York, NY'

    coordinates_hash = GeocodingService.get_coordinates(location)

    expect(coordinates_hash).to be_a(Hash)
    expect(coordinates_hash).to have_key(:latitude)
    expect(coordinates_hash[:latitude]).to be_a Float
    expect(coordinates_hash).to have_key(:longitude)
    expect(coordinates_hash[:longitude]).to be_a Float
    expect(coordinates_hash.keys.count).to eq(2)
  end
end