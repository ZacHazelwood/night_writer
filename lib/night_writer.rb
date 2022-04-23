require "./lib/file_reader"
require './lib/file_writer'

class NightWriter

  attr_reader :file_reader,
              :file_writer

  def initialize
    @file_reader = FileReader.new.read
    @file_writer = FileWriter.new
  end

end

night_reader = NightWriter.new
