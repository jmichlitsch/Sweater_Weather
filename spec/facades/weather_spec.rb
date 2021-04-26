require 'rails_helper'

RSpec.describe WeatherFacade do
  it '.forecast' do
    VCR.use_cassette('jacksonville,fl') do
      forecast = WeatherFacade.forecast('jacksonville,fl')

      expect(forecast).to be_a(ForecastPoro)
    end
  end
end
