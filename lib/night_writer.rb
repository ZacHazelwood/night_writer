require "./lib/file_reader"
require './lib/file_writer'

class NightWriter

  attr_reader :file_reader,
              :file_writer

  def initialize
    @file_reader = FileReader.new.read
    @file_writer = FileWriter.new
    @file_writer.write_file
  end

  def confirmation_display
    total_characters = @file_reader.chomp.length
      puts "Created '#{ARGV[1]}' containing #{total_characters} characters."
  end
end

night_reader = NightWriter.new
night_reader.confirmation_display
