
class FileWriter

  attr_reader :written_file,
              :total_char_count

  def initialize
    @written_file = ARGV[1]
    @total_char_count = 0
  end

  def write_file
    @total_char_count = File.write(@written_file, "w")
  end

end
