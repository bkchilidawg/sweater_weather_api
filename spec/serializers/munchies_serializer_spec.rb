require 'rails_helper'

RSpec.describe MunchiesSerializer do
  let(:restaurant) { { name: 'Test Restaurant', address: '123 Main St', rating: 4.5, reviews: 100 } }
  let(:forecast) { { temperature: 75, condition: 'Sunny' } }
  let(:destination) { 'Test city, TEST STATE' }

  subject { described_class.new(Munchies.new(restaurant, forecast, destination)).as_json }

  describe 'when Munchies object has all data' do
    it 'serializes Munchies with destination, forecast, and restaurant' do

      expect(subject['data']['attributes']['destination']).to eq('Test city,  TEST STATE')
      expect(subject['data']['attributes']['forecast']).to eq({ "temperature" => 75, "condition" => "Sunny" })
      expect(subject['data']['attributes']['restaurant']).to eq({ "name" => 'Test Restaurant', "address" => '123 Main St', "rating" => 4.5, "reviews" => 100 })
    end
  end
end