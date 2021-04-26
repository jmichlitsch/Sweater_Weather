require 'rails_helper'

RSpec.describe BackgroundFacade do
  it 'creates a background object' do
    VCR.use_cassette('miami') do
      background = BackgroundFacade.background('miami,fl')

      expect(background).to be_a(BackgroundPoro)
    end
  end
end
