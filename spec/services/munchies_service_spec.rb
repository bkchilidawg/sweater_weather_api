require "rails_helper"

RSpec.describe "an API call", :vcr do 
  it "will return restaurant data based on location" do
    restaurant = MunchiesService.get_restaurant("Juniors", 22.690468, -10.498943)

    expect(restaurant).to be_a Hash 
    expect(restaurant.keys.count).to eq(3)
    expect(restaurant).to have_key(:name)
    expect(restaurant[:name]).to be_a String
    expect(restaurant).to have_key(:address)
    expect(restaurant[:address]).to be_a String
    expect(restaurant).to have_key(:rating)
    expect(restaurant[:rating]).to be_a Float
    expect(restaurant).to have_key(:reviews)
    expect(restaurant[:reviews]).to be_a Integer

  end
end