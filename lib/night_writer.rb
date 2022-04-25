# require './lib/file_reader_and_writer'
# require './lib/translator'
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
    # puts "Created #{output_file_name}"
  end

  def do_the_thing
    # require "pry"; binding.pry
    text = read_file(@input_file_name)
    translated_characters = Translator.new(text).arrange_braille
    create_output_file(@output_file_name, translated_characters)
    # Get create to output a file and confirmation_message to take that as an argument
    confirmation_message(@output_file_name)
  end
end

# night_writer = NightWriter.new(ARGV[0], ARGV[1]).do_the_thing
