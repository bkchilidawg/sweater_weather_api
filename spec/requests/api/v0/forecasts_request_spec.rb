require 'rails_helper'

RSpec.describe Api::V0::ForecastController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with the forecast' do
      location = 'New York'
      forecast = double('forecast')
      forecast_serializer = double('forecast_serializer')

      allow(ForecastFacade).to receive(:get_forecast).with(location).and_return(forecast)
      allow(ForecastSerializer).to receive(:new).with(forecast).and_return(forecast_serializer)
      allow(forecast_serializer).to receive(:to_json).and_return('{"key": "value"}') # Modify this line

      get :index, params: { location: location }

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(forecast_serializer.to_json)
    end
  end
end
