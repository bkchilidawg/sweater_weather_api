require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { User.new(email: 'test@example.com', api_key: 'abc123') }
  let(:serialized_user) { described_class.new(user).serializable_hash }

  it 'serializes the email attribute' do
    expect(serialized_user[:data][:attributes][:email]).to eq('test@example.com')
  end

  it 'serializes the api_key attribute' do
    expect(serialized_user[:data][:attributes][:api_key]).to eq('abc123')
  end
end
