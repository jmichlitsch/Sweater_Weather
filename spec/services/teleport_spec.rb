require 'rails_helper'

RSpec.describe TeleportService do
  it "can get salary info" do
    data = TeleportService.call("chicago")[:salaries]

    expect(data).to be_a(Array)
    expect(data[0]).to be_a(Hash)
    result = data[0][:salary_percentiles]
    result_name = data[0][:job]
    check_hash_structure(result_name, :title, String)
    check_hash_structure(result_name, :id, String)
    check_hash_structure(result, :percentile_25, Integer)
    check_hash_structure(result, :percentile_50, Integer)
    check_hash_structure(result, :percentile_75, Integer)
  end
end
