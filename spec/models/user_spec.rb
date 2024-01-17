require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe 'associations' do
    it { should have_secure_password }
  end

  describe 'callbacks' do
    it 'should generate an API key before creating a user' do
      user = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
      user.save
      expect(user.api_key).not_to be_nil
    end
  end
end
