require 'rails_helper'

RSpec.describe TelecastPoro do
  it 'can make a telecast poro' do
    data = TeleportService.call("chicago")

    telecast_poro = TelecastPoro.new(data)
    expect(telecast_poro.title).to eq(data)
    # expect(telecast_poro.min).to eq(data)
    # expect(telecast_poro.max).to eq(data)
  end
end
