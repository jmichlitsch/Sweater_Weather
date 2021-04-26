class WeatherFacade
  def self.forecast(location)
    location_data = LocationService.call(location)
    coordinates = lookup(location)
    weather_data = WeatherService.call(coordinates[:lat], coordinates[:lng])
    ForecastPoro.new(weather_data)
  end

  def self.lookup(location)
   location_data = LocationService.call(location)
   coordinates = location_data[:results][0][:locations][0][:latLng]
   coordinates if coordinates != { lat: 39.390897, lng: -99.066067}
 end
end
