require_relative 'file_reader_and_writer'
require_relative 'translator'

class NightWriter
  include FileReaderAndWriter

  attr_reader :input_file_name,
              :output_file_name

  def initialize(input_file_name, output_file_name)
    @input_file_name = input_file_name
    @output_file_name = output_file_name
  end

  def confirmation_message(output_file_name)
    total_characters = read_file(output_file_name).chomp.length
    puts "Created #{output_file_name} containing #{total_characters} characters."
  end

  def do_the_thing
    text = read_file(@input_file_name)
    translated_characters = Translator.new(text).arrange_braille
    create_output_file(@output_file_name, translated_characters)
    confirmation_message(@output_file_name)
  end
end
