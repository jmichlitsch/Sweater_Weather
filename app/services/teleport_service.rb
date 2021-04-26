class TeleportService
  class << self

    private

    def conn
      @conn ||= Faraday.new(url: 'https://api.teleport.org')
    end

    def parse_data(response)
      JSON.parse(reponse.body, symbolize_names: true)
    end
  end
end
