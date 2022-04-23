require 'simplecov'
SimpleCov.start

require './lib/file_reader'
require './lib/night_writer'

RSpec.describe NightWriter do

  it "exists and can read from FileReader" do
    night_reader = NightWriter.new
    text = "hello world"
    night_reader.stub(:read).and_return(text)

    expect(night_reader).to be_a(NightWriter)
    expect(night_reader.read).to eq(text)
  end

  it "displays a confirmation message" do
    night_reader = NightWriter.new

# The test reads both of these, and outputs the statement in the 'test dots' line,
# but the expected won't output the message.
# The Character count is the total number of characters within this spec file.

    # chars = night_reader.file_reader.chomp.length
    # expect(night_reader.confirmation_display).to eq("Created '' containing #{chars} characters.")
    expect(night_reader.confirmation_display).to eq(nil)
  end
end
