class TeleportFacade
  def self.get_salary(destination)
    data = TeleportService.call(destination)

    data_a = TelecastPoro.new(data[:salaries][15])
    data_sc = TelecastPoro.new(data[:salaries][16])
    mobile = TelecastPoro.new(data[:salaries][32])
    qa_engineer = TelecastPoro.new(data[:salaries][41])
    sofware = TelecastPoro.new(data[:salaries][45])
    system  = TelecastPoro.new(data[:salaries][46])
    web_dev  = TelecastPoro.new(data[:salaries][50])
    array = [data_a, data_sc, mobile, qa_engineer, sofware, system, web_dev]
  end
end
