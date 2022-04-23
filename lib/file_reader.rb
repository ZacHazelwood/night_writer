class FileReader
  def read
    file_to_read = ARGV[0]
    File.read(file_to_read)
  end
end
