

class FileWriter

  attr_reader :output_file_name

  def initialize
    @output_file_name = ARGV[1]
  end

  def write_file
    File.new(@output_file_name, "w")
  end
end
