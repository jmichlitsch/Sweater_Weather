require 'rails_helper'

RSpec.describe TripService do
  it 'gets info for a trip between two cities' do
    VCR.use_cassette('denver_to_seattle') do
      trip_params = {
        origin: 'Denver,CO',
        destination: 'Seattle,WA'
      }

      trip_info = TripService.call(trip_params)

      expect(trip_info).to be_a(Hash)
      check_hash_structure(trip_info, :route, Hash)
      check_hash_structure(trip_info[:route], :formattedTime, String)
      check_hash_structure(trip_info[:route], :time, Numeric)
    end
  end

  it 'gets info for a trip between different cities' do
    VCR.use_cassette('no_to_chicago') do
      trip_params = {
        origin: 'New Orleans, LA',
        destination: 'Chicago, IL'
      }

      trip_info = TripService.call(trip_params)

      expect(trip_info).to be_a(Hash)
      check_hash_structure(trip_info, :route, Hash)
      check_hash_structure(trip_info[:route], :formattedTime, String)
      check_hash_structure(trip_info[:route], :time, Numeric)
    end
  end

  it 'returns a message if the trip is impossible' do
    VCR.use_cassette('denver_to_berlin_trip') do
      trip_params = {
        origin: 'Denver,CO',
        destination: 'Berlin, DEU'
      }

      trip_info = TripService.call(trip_params)

      expect(trip_info).to be_a(Hash)
      check_hash_structure(trip_info, :route, Hash)
      check_hash_structure(trip_info, :info, Hash)
      check_hash_structure(trip_info[:info], :messages, Array)
      expect(trip_info[:info][:messages][0]).to eq("We are unable to route with the given locations.")
    end
  end
end
