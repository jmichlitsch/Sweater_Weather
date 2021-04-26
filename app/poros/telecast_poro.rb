class TelecastPoro

  attr_reader :title,
              :min,
              :max
  def initialize(data)
    @title = data[:job][:title]
    @min = data[:salary_percentiles][:percentile_25].round(2)
    @max = data[:salary_percentiles][:percentile_75].round(2)
  end

end
