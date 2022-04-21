require './lib/file_reader'

RSpec.describe FileReader do

  it "exists" do
    file_reader = FileReader.new

    expect(file_reader).to be_a(FileReader)
  end


end
