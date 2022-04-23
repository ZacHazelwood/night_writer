require './lib/file_writer'

RSpec.describe FileWriter do

  it "exists" do
    file_write = FileWriter.new


    expect(file_write).to be_a(FileWriter)
  end

end
