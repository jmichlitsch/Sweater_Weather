require 'rails_helper'

def local_time(time, offset)
  Time.at(time).getlocal(offset).to_s
end

RSpec.describe WeatherPoro do
  it 'can be initialized with current weather data' do
    data = {
      dt: 1615047412,
      sunrise: 1615029583,
      sunset: 1615070808,
      temp: 16.57,
      feels_like: 7.88,
      pressure: 1016,
      humidity: 58,
      dew_point: 5.67,
      uvi: 2.15,
      clouds: 75,
      visibility: 10000,
      wind_speed: 4.61,
      wind_deg: 0,
      weather: [
        {
          id: 803,
          main: "Clouds",
          description: "broken clouds",
          icon: "04d"
          }
      ]
    }
    tz_offset = -18000
    snapshot = WeatherPoro.new(data, tz_offset, :datetime)
    expect(snapshot).to be_a(WeatherPoro)
    expect(snapshot).to have_attributes(
      datetime: local_time(data[:dt], tz_offset),
      sunrise: local_time(data[:sunrise], tz_offset),
      sunset: local_time(data[:sunset], tz_offset),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    )
  end

  it 'can be initialized with daily weather data' do
    data = {
      dt: 1615046400,
      sunrise: 1615029583,
      sunset: 1615070808,
      temp: {
        day: 17.38,
        min: 4.28,
        max: 21.49,
        night: 9.63,
        eve: 15.87,
        morn: 4.28
      },
      feels_like: {
        day: 7.5,
        night: 2.93,
        eve: 7.3,
        morn: -3.35
      },
      pressure: 1017,
      humidity: 73,
      dew_point: 10.99,
      wind_speed: 7.31,
      wind_deg: 268,
      min: 4.28,
      max: 21.49,
      weather: [
        {
          id: 804,
          main: "Clouds",
          description: "overcast clouds",
          icon: "04d"
          }
        ],
       clouds: 87,
       pop: 0.08,
       uvi: 2.29
     }

    tz_offset = -18000
    snapshot = WeatherPoro.new(data, tz_offset, :datetime)
    expect(snapshot).to be_a(WeatherPoro)
    expect(snapshot).to have_attributes(
      sunrise: local_time(data[:sunrise], tz_offset),
      sunset: local_time(data[:sunset], tz_offset),
      min_temp: data[:min],
      max_temp: data[:max],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    )
  end

  it 'can be initialized with hourly weather data' do
    data = {
      dt: 1615046400,
      temp: 16.57,
      feels_like: 6.55,
      pressure: 1016,
      humidity: 58,
      dew_point: 5.67,
      uvi: 2.15,
      clouds: 75,
      visibility: 10000,
      wind_speed: 6.98,
      wind_deg: 266,
      weather: [
        {
          id: 803,
          main: "Clouds",
          description: "broken clouds",
          icon: "04d"
          }
        ],
      pop: 0
    }
    tz_offset = -18000
    snapshot = WeatherPoro.new(data, tz_offset, :time)

    expect(snapshot).to be_a(WeatherPoro)
    expect(snapshot).to have_attributes(
      time: local_time(data[:dt], tz_offset).split[1],
      temperature: data[:temp],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    )
  end
end
