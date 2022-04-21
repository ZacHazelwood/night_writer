require 'simplecov'
SimpleCov.start

require './lib/file_reader'
require './lib/night_reader'

RSpec.describe NightReader do

  it "exists" do
    night_reader = NightReader.new

    expect(night_reader).to be_a(NightReader)
  end
end
