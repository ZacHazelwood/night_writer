require "./lib/file_reader"

class NightWriter

  attr_reader :file_reader

  def initialize
    @file_reader = FileReader.new.read
  end

  def confirmation_display
    total_characters = @file_reader.chomp.length
      puts "Created '#{ARGV[1]}' containing #{total_characters} characters."
  end
end

night_reader = NightWriter.new
night_reader.confirmation_display
