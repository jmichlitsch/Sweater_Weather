require 'rails_helper'

RSpec.describe TeleportFacade do
  it "can get salary info" do
    salaries = TeleportFacade.get_salary("chicago")

    expect(salaries).to be_a(Array)
  end
end
