class TeleportService
  class << self

    def call(destination)
      response = conn.get("/api/urban_areas/slug%3A#{destination}/salaries/")
      be = parse_data(response)
      binding.pry
    end

    private

    def conn
      @conn ||= Faraday.new(url: 'https://api.teleport.org')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
