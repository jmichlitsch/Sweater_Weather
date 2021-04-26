require 'rails_helper'

describe TelecastSerializer, type: :class do
  it 'serializes TelecastPoro objects' do
    data = TeleportService.call("chicago")[:salaries]

    serialized = TelecastSerializer.new(TeleportFacade.get_salary("chicago"))
    binding.pry
    test = JSON.parse(serialized, symbolize_names: true)
    expect(test[:title]).to be_a(String)
    expect(test[:title]).to be_a(String)
    expect(test[:title]).to be_a(String)
  end
end
