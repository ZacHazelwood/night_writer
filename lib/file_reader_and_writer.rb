module FileReaderAndWriter

  def create_output_file(file_to_write, translated_characters)
    File.write(file_to_write, translated_characters)
  end

  def read_file(file_to_read)
    File.read(file_to_read)
  end
end
