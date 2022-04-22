require "./lib/file_reader"

class NightReader

  attr_reader :file_reader

  def initialize
    @file_reader = FileReader.new.read
  end

  def confirmation_display
    total_characters = @file_reader.chomp.length
      puts "Created '#{ARGV[1]}' containing #{total_characters} characters."
  end


end
