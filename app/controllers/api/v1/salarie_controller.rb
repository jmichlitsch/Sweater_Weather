class Api::V1::SalarieController < ApplicationController

  def show
    location = "denver"
    @conn ||= Faraday.new(url: 'https://api.teleport.org')
    response = @conn.get("/urban_areas/slug%3A#{location}/salaries/")
    be = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
