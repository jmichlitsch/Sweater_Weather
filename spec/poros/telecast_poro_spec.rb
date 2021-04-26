require 'rails_helper'

RSpec.describe TelecastPoro do
  it 'can make a telecast poro' do
    data = TeleportService.call("chicago")[:salaries][15]
    telecast_poro = TelecastPoro.new(data)
    expect(telecast_poro.title).to eq(data[:job][:title])
    expect(telecast_poro.min).to eq(data[:salary_percentiles][:percentile_25].round(2))
    expect(telecast_poro.max).to eq(data[:salary_percentiles][:percentile_75].round(2))
  end
end
