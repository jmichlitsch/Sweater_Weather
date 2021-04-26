require 'rails_helper'

RSpec.describe BackgroundService do
  it 'can get an image' do
    VCR.use_cassette('miami') do
      data = BackgroundService.call('miami,fl')

      expect(data).to be_a(Hash)
      check_hash_structure(data, :results, Array)
      expect(data[:results].size).to eq(1)
      result = data[:results][0]
      expect(result).to be_a(Hash)
      check_hash_structure(result, :urls, Hash)
      check_hash_structure(result[:urls], :raw, String)
      check_hash_structure(result, :user, Hash)
      check_hash_structure(result[:user], :name, String)
      check_hash_structure(result[:user], :links, Hash)
      check_hash_structure(result[:user][:links], :html, String)
    end
  end

  it 'can get an image of a different city' do
    VCR.use_cassette('new_york') do
      data = BackgroundService.call('new%20york,ny')

      expect(data).to be_a(Hash)
      check_hash_structure(data, :results, Array)
      expect(data[:results].size).to eq(1)
    end
  end

  it 'returns empty results if an image can\'t be found' do
    VCR.use_cassette('notabackground') do
      data = BackgroundService.call('NOTAREALPLACE')

      expect(data).to be_a(Hash)
      check_hash_structure(data, :results, Array)
      expect(data[:results]).to be_empty
    end
  end
end
