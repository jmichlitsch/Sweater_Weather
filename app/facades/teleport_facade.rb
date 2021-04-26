class TeleportFacade
  def self.salaries(destination)
    data = TeleportService.call(destination)
    data_anlayst = TeleportPoro.new(data[:salaries][15])
    data_scientist = TeleportPoro.new(data[:salaries][16])

  end
end
