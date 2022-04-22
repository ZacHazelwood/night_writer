require 'simplecov'
SimpleCov.start

require './lib/file_reader'
require './lib/night_reader'

RSpec.describe NightReader do

  it "exists and can read from FileReader" do
    night_reader = NightReader.new
    text = "hello world"
    night_reader.stub(:read).and_return(text)

    expect(night_reader).to be_a(NightReader)
    expect(night_reader.read).to eq(text)
  end
end
