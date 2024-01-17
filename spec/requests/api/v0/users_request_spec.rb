require 'rails_helper'

RSpec.describe "Api::V0::Users", type: :request do
  describe "POST /create" do
    new_user = {
      "email": "test@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    new_user_2 = {
      "email": "test2@example.com",  
      "password": "password",
      "password_confirmation": "password"
    }

    describe "with valid parameters" do
      before { post api_v0_users_path, params: new_user  }

      it "creates a new user" do
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["data"]["attributes"]["email"]).to eq(new_user[:email])
        expect(User.find_by(email: new_user[:email])).to be_present
      end

      it "returns a unique api key" do
        expect(response).to have_http_status(:created)
        user = User.find_by(email: new_user[:email])
        
        expect(user).to be_present
        expect(JSON.parse(response.body)["data"]["attributes"]["api_key"]).to eq(user.api_key)
      end
    end

    describe "with invalid parameters" do
      before { post api_v0_users_path, params: { user: new_user_2 } }

      it "does not create a new user" do
        expect(response).to have_http_status(:bad_request)
        expect(User.find_by(email: new_user_2[:email])).to be_nil
      end

      it "returns an error message" do
        expect(JSON.parse(response.body)["error"]).to be_present
      end
    end
  end
end
