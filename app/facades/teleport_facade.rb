class TeleportFacade
  def self.get_salary(destination)
    data = TeleportService.call(destination)

    a = data[:salaries][15]
    b = data[:salaries][16]
    c = data[:salaries][32]
    d = data[:salaries][41]
    e = data[:salaries][45]
    f  = data[:salaries][46]
    g  = data[:salaries][50]
    array = [a, b, c, d, e, f, g]
  end
end
