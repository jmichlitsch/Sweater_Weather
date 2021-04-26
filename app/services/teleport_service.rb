class TeleportService
  class << self

    def call(destination)
      response = conn.get("/api/urban_areas/slug%3A#{destination}/salaries/")
      parse_data(response)
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
