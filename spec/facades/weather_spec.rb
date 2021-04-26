require 'rails_helper'

RSpec.describe WeatherFacade do
  it '.forecast' do
    VCR.use_cassette('jacksonville') do
      forecast = WeatherFacade.forecast('rutland,vt')

      expect(forecast).to be_a(Forecast)
    end
  end
end
