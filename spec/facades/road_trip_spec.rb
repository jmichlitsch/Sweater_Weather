require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'creates a RoadTripPoro object' do
    VCR.use_cassette('denver_to_seattle') do
          trip_params = {
            origin: 'Denver,CO',
            destination: 'Seattle,WA'
          }
      road_trip = RoadTripFacade.road_trip(trip_params)

      expect(road_trip).to be_a(RoadTripPoro)
    end
  end
end
