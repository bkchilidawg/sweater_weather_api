require 'rails_helper'

RSpec.describe "Sessions Create" do

  before :each do
    new_user = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post "/api/v0/users", params: new_user.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
  end

  it "Post request for sessions create" do
    new_session = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post "/api/v0/sessions", params: new_session.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "returns an error message with invalid password credentials" do
    new_session = {
      "email": "whatever@example.com",
      "password": "password1"
    }

    post "/api/v0/sessions", params: new_session.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)["error"]).to be_present
  end

  it "returns an error message with invalid email credentials" do
    new_session = {
      "email": "whatever1@example.com",
      "password": "password"
    }

    post "/api/v0/sessions", params: new_session.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)["error"]).to be_present
  end
end
