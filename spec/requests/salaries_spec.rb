require 'rails_helper'

RSpec.describe 'background request' do
  it 'retrieves a background image for a location' do
      headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
      get '/api/v1/salaries?destination=chicago', headers: headers
      data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)

      expect(data).to be_a(Hash)
      binding.pry
      check_hash_structure(data, :data, Hash)
  end
end
