class ForecastPoro
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily][0..4])
    @hourly_weather = hourly(data[:hourly][0..7])
  end

  def current(data)
    WeatherPoro.new(data)
  end

  def daily(data)
    data.map do |day|
      WeatherPoro.new(day)
    end
  end

  def hourly(data)
    data.map do |hour|
      WeatherPoro.new(hour)
    end
  end
end
