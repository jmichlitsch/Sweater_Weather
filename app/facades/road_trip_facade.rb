class RoadTripFacade
  def self.road_trip(params)
    trip_info = TripService.call(params)
    if trip_info[:info][:messages].empty?
     destination_coordinates = trip_info[:route][:locations][1][:latLng]
     arrival_time = trip_info[:route][:time]
     forecast = arrival_forecast(destination_coordinates, arrival_time)
     RoadTripPoro.new(params, trip_info[:route][:formattedTime], forecast)
   else
     RoadTripPoro.new(params)
   end
  end

  def self.arrival_forecast(coordinates, arrival_time)
    data = WeatherService.call(coordinates[:lat], coordinates[:lng])
    (data[:hourly] | data[:daily]).find do |snapshot|
      snapshot[:dt] >= (Time.now.to_i + arrival_time)
    end.slice(:temp, :weather)
  end
end
