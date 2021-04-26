require 'rails_helper'

describe TelecastSerializer, type: :class do
  xit 'serializes TelecastPoro objects' do
    data = TeleportService.call("chicago")[:salaries]

    serialized = TelecastSerializer.new(TeleportFacade.get_salary("chicago"))
    expect(test[:title]).to be_a(String)
    expect(test[:title]).to be_a(Float)
    expect(test[:title]).to be_a(Float)
  end
end
