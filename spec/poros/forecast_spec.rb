require 'rails_helper'

RSpec.describe ForecastPoro do
  it 'exists and has attributes' do
    data = File.read('./spec/fixtures/forecast.json')
    weather_info = JSON.parse(data, symbolize_names: true)

    forecast = ForecastPoro.new(weather_info)

    expect(forecast).to be_a(ForecastPoro)
    expect(forecast).to have_attributes(
      current_weather: a_kind_of(WeatherPoro),
      daily_weather: a_kind_of(Array),
      hourly_weather: a_kind_of(Array)
    )
    expect(forecast.daily_weather.size).to eq(5)
    expect(forecast.daily_weather[0]).to be_a(WeatherPoro)
    expect(forecast.hourly_weather.size).to eq(8)
    expect(forecast.hourly_weather[0]).to be_a(WeatherPoro)
  end
end
