require 'simplecov'
SimpleCov.start

require './lib/file_writer'

RSpec.describe FileWriter do

  it "exists" do
    file_writer = FileWriter.new

    expect(file_writer).to be_a(FileWriter)    
  end
end
