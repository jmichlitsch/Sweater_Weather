class Api::V1::SalarieController < ApplicationController

  def show
    @conn ||= Faraday.new(url: 'https://api.teleport.org')
    response = @conn.get('/api/urban_areas/')
    be = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
