require 'simplecov'
SimpleCov.start

require './lib/file_reader'
require './lib/night_writer'

RSpec.describe NightWriter do

  it "exists" do
    night_writer = NightWriter.new

    expect(night_writer).to be_a(NightWriter)
  end
end
