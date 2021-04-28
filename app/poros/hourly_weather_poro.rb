class HourlyWeatherPoro < WeatherPoro
  def initialize(data, timezone_offset)
    @time = local_time(data[:dt], timezone_offset).split[1]
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
