require 'rails_helper'

RSpec.describe 'forecast request' do
  it 'gets weather for a specified location' do
    VCR.use_cassette('jacksonville_forecast') do
      headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
      get '/api/v1/forecast?location=denver,co', headers: headers

      expect(response.status).to eq(200)
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      check_hash_structure(data, :data, Hash)
      check_hash_structure(data[:data], :id, NilClass)
      check_hash_structure(data[:data], :type, String)
      check_hash_structure(data[:data], :attributes, Hash)

      attributes = data[:data][:attributes]

      check_hash_structure(attributes, :current_weather, Hash)
      check_hash_structure(attributes[:current_weather], :datetime, String)
      check_hash_structure(attributes[:current_weather], :sunrise, String)
      check_hash_structure(attributes[:current_weather], :sunset, String)
      check_hash_structure(attributes[:current_weather], :temperature, Float)
      check_hash_structure(attributes[:current_weather], :feels_like, Float)
      check_hash_structure(attributes[:current_weather], :humidity, Numeric)
      check_hash_structure(attributes[:current_weather], :uvi, Numeric)
      check_hash_structure(attributes[:current_weather], :visibility, Numeric)
      check_hash_structure(attributes[:current_weather], :conditions, String)
      check_hash_structure(attributes[:current_weather], :icon, String)

      check_hash_structure(attributes, :daily_weather, Array)
      expect(attributes[:daily_weather].size).to eq(5)
      day = attributes[:daily_weather][0]
      expect(day).to be_a(Hash)
      check_hash_structure(day, :date, String)
      check_hash_structure(day, :sunrise, String)
      check_hash_structure(day, :sunset, String)
      check_hash_structure(day, :max_temp, Float)
      check_hash_structure(day, :min_temp, Float)
      check_hash_structure(day, :conditions, String)
      check_hash_structure(day, :icon, String)

      check_hash_structure(attributes, :hourly_weather, Array)
      expect(attributes[:hourly_weather].size).to eq(8)
      hour = attributes[:hourly_weather][0]
      expect(hour).to be_a(Hash)
      check_hash_structure(hour, :time, String)
      check_hash_structure(hour, :temperature, Numeric)
      check_hash_structure(hour, :conditions, String)
      check_hash_structure(hour, :icon, String)
    end
  end

  it 'returns an error with a message if the location is blank' do
   headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
   get '/api/v1/forecast?location', headers: headers

   expect(response.status).to eq(400)
   errors = JSON.parse(response.body, symbolize_names: true)

   expect(errors).to be_a(Hash)
   expect(errors.keys).to match_array(%i[errors])
   check_hash_structure(errors, :errors, Array)
   expect(errors[:errors][0]).to be_a(String)
 end

   it 'returns an error with a message if the external maps API call is unsuccessful' do
     stub_request(:get, "https://mapquestapi.com/geocoding/v1/address?key=#{ENV['LOCATION_API_KEY']}&location=denver,co").to_return(status: 503)
     headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
     get '/api/v1/forecast?location=denver,co', headers: headers

     expect(response.status).to eq(503)
     errors = JSON.parse(response.body, symbolize_names: true)

     expect(errors).to be_a(Hash)
     expect(errors.keys).to match_array(%i[errors])
     check_hash_structure(errors, :errors, Array)
     expect(errors[:errors][0]).to be_a(String)
  end
end
