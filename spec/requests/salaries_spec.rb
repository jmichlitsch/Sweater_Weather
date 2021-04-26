require 'rails_helper'

RSpec.describe 'background request' do
  it 'retrieves a background image for a location' do
      headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
      get '/api/v1/salaries?destination=chicago', headers: headers
      expect(response.status).to eq(200)
      expect(response.body).to be_a(String)
  end
end
