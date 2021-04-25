require 'rails_helper'

RSpec.describe WeatherService do
  describe '.call' do
    it 'can get weather using a set of coordinates' do
      lat = 30.325968
      lng = -81.65676

      data = WeatherService.call(lat, lng)
      expect(data).to be_a(Hash)
      check_hash_structure(data, :current, Hash)
      check_hash_structure(data[:current], :dt, Numeric)
      check_hash_structure(data[:current], :sunrise, Numeric)
      check_hash_structure(data[:current], :sunset, Numeric)
      check_hash_structure(data[:current], :temp, Numeric)
      expect(-50..120).to cover(data[:current][:temp])
      check_hash_structure(data[:current], :feels_like, Numeric)
      check_hash_structure(data[:current], :humidity, Numeric)
      check_hash_structure(data[:current], :uvi, Numeric)
      check_hash_structure(data[:current], :visibility, Numeric)
      check_hash_structure(data[:current], :weather, Array)
      expect(data[:current][:weather][0]).to be_a(Hash)
      check_hash_structure(data[:current][:weather][0], :description, String)
      check_hash_structure(data[:current][:weather][0], :icon, String)

      check_hash_structure(data, :hourly, Array)
      hour = data[:hourly][0]
      expect(hour).to be_a(Hash)
      check_hash_structure(hour, :dt, Numeric)
      check_hash_structure(hour, :temp, Numeric)
      check_hash_structure(hour, :weather, Array)
      expect(hour[:weather][0]).to be_a(Hash)
      check_hash_structure(hour[:weather][0], :description, String)
      check_hash_structure(hour[:weather][0], :icon, String)

      check_hash_structure(data, :daily, Array)
      day = data[:daily][0]
      expect(day).to be_a(Hash)
      check_hash_structure(day, :dt, Numeric)
      check_hash_structure(day, :sunrise, Numeric)
      check_hash_structure(day, :sunset, Numeric)
      check_hash_structure(day, :temp, Hash)
      check_hash_structure(day[:temp], :min, Numeric)
      check_hash_structure(day[:temp], :max, Numeric)
      check_hash_structure(day, :weather, Array)
      expect(day[:weather][0]).to be_a(Hash)
      check_hash_structure(day[:weather][0], :description, String)
      check_hash_structure(day[:weather][0], :icon, String)

    end

    it 'can get weather for a different city' do
      lat = 44.058088
      lng = -121.31515

      data = WeatherService.call(lat, lng)
      expect(data).to be_a(Hash)
      check_hash_structure(data, :current, Hash)
      check_hash_structure(data, :hourly, Array)
      check_hash_structure(data, :daily, Array)
    end
  end
end
