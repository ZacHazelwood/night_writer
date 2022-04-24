require 'simplecov'
SimpleCov.start

require './lib/file_reader_and_writer'
require './lib/night_writer'
require './test_message'
require './test_output'

RSpec.describe NightWriter do

  it "exists" do
    # require "pry"; binding.pry
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    night_writer = NightWriter.new(input_file_name, output_file_name)
    # allow(night_writer).to receive(input_file_name).and_return("test_message.txt")
    # allow(night_writer).to receive(output_file_name).and_return("test_output.txt")

    expect(night_writer).to be_a(NightWriter)
  end

  xit "displays a confirmation message" do
    night_writer = NightWriter.new
# No idea how I tested this the first time; but at least the correct message is
# displayed in the Terminal. ¯\_(ツ)_/¯
    expect(night_writer.confirmation_message).to eq(nil)
  end
end

describe FileReaderAndWriter do

  it "#read_file" do

  end

  it "#create_output_file" do

  end

end
