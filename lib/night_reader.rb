require "./lib/file_reader"

class NightReader

  attr_reader :file_reader

  def initialize
    @file_reader = FileReader.new.read
  end

end
