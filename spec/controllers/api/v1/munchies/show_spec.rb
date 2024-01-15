require 'rails_helper'

RSpec.describe "API::V1::Munchies", type: :request do
  it "Get request for munchies show", :vcr do
    get "/api/v1/munchies?destination=tulsa,ok&food=mexican"
    
    expect(response).to be_successful
    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to be_a Hash
    expect(json_response[:data]).to be_a Hash
    expect(json_response[:data][:id]).to be nil
    expect(json_response[:data][:type]).to eq("munchies")
    data = json_response[:data][:attributes]
    expect(data).to be_a Hash
  end
end
