require 'simplecov'
SimpleCov.start

require './lib/file_reader_and_writer'
require './lib/night_writer'

RSpec.describe NightWriter do

  it "exists" do
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    night_writer = NightWriter.new(input_file_name, output_file_name)

    expect(night_writer).to be_a(NightWriter)
  end

  it "displays a confirmation message" do
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    night_writer = NightWriter.new(input_file_name, output_file_name)

    expect(night_writer.confirmation_message(output_file_name)).to eq(nil)
    # => "Created test_output.txt containing 218 characters."
  end

  it "runs" do
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    night_writer = NightWriter.new(input_file_name, output_file_name)

    expect(night_writer.run).to eq(nil)
  end
end

describe FileReaderAndWriter do

  it "#read_file" do
    # require "pry"; binding.pry
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    night_writer = NightWriter.new(input_file_name, output_file_name)

    expect(night_writer.read_file('message.txt')).to be_a(String)
  end

  it "#create_output_file" do
    input_file_name = "test_message.txt"
    output_file_name = "test_output.txt"
    text = "aaa"
    night_writer = NightWriter.new(input_file_name, output_file_name)

    expect(night_writer.create_output_file(output_file_name, text)).to eq(3)
  end

end


# allow(:run).to_require
# ARGV = ['message.txt', 'braille.txt']
# allow(input_file_name).to receive(:read_file).with('message.txt')
