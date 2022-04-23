require 'simplecov'
SimpleCov.start

require './lib/file_writer'

RSpec.describe FileWriter do

  it "exists" do
    file_write = FileWriter.new


    expect(file_write).to be_a(FileWriter)
  end

  it "can write a file" do
    file_write = FileWriter.new
    output = "output"
    file_write.stub(:read).and_return(output)


    expect(file_write.write_file).to eq(nil)
  end

  # it 'How to mock File.open for write with rspec 3.4' do
  #   file_writer = FileWriter.new
  #   buffer = StringIO.new()
  #   file_name = "somefile.txt"
  #   content = "the content fo the file"
  #   allow(file_writer).to receive(:open).with(file_name,'w').and_yield( buffer )
  #   # call the function that writes to the file
  #   # file_write.write_file {|f| f.write(content)}
  #   # reading the buffer and checking its content.
  #   expect(file_write.write_file).to eq(content)
  # end

end
