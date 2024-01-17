require 'spec_helper'

RSpec.describe ErrorSerializer do
  describe '#error_json' do
    it 'returns the error JSON' do
      error_message = 'Something went wrong'
      status = 500
      serializer = ErrorSerializer.new(error_message)

      expected_json = { error: { message: error_message, status: nil } }
      expect(serializer.error_json(status)).to eq(expected_json)
    end
  end
end
