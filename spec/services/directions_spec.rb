require 'rails_helper'

RSpec.describe DirectionsService do
  describe '.conn' do
    it 'returns a Faraday connection' do
      conn = DirectionsService.conn
      expect(conn).to be_a(Faraday::Connection)
    end
  end

  describe '.get_travel_time' do
    let(:origin) { 'New York, NY' }
    let(:destination) { 'Los Angeles, CA' }

    it 'returns the travel time and unix time' do
      response_body = {
        route: {
          formattedTime: '5 hours 30 minutes',
          realTime: 18000
        }
      }.to_json

      stub_request(:get, "https://www.mapquestapi.com/directions/v2/route?key=#{Rails.application.credentials.mapquest_api[:key]}&from=#{origin}&to=#{destination}")
        .to_return(status: 200, body: response_body)

      result = DirectionsService.get_travel_time(origin, destination)
      expect(result).to eq({ travel_time: '5 hours 30 minutes', unix: 18000 })
    end
  end
end
