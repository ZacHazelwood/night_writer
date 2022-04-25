require './lib/english_to_braille'

class Translator
  include EnglishToBraille

  attr_reader :text,
              :dictionary

  def initialize(text)
    @text = text.delete("\n")
    @dictionary = ENGLISH_TO_BRAILLE_HASH
  end

  def convert_to_braille
    english_letters = @text.chars
    converted_braille = []
        (english_letters.count).times do |letter|
          converted_braille << @dictionary[english_letters.shift]
        end
    converted_braille.each_slice(40).to_a
  end

  def arrange_braille
    transposed_sentence = []
    format_sentences = []
    joined_sentences = []
    output_braille = ""
    translated_braille = self.convert_to_braille
      translated_braille.each do |sentence|
        transposed_sentence << sentence.transpose
      end
      transposed_sentence.map do |segment|
        top = segment[0].join
        mid = segment[1].join
        bot = segment[2].join
        format_sentences << [top, mid, bot]
      end
      format_sentences.each do |sentence|
        sentence.each do |line|
          joined_sentences << line
        end
      end
      joined_sentences.each do |line|
        output_braille += "#{line}\n"
      end
    output_braille
  end

  def transposed_conversion

  end  
  # def arrange_braille
  #   transposed_sentence = []
  #   format_sentences = []
  #   joined_sentences = []
  #   output_braille = ""
  #   translated_braille = self.convert_to_braille
  #     translated_braille.each do |sentence|
  #       transposed_sentence << sentence.transpose
  #     end
  #     transposed_sentence.map do |segment|
  #       top = segment[0].join
  #       mid = segment[1].join
  #       bot = segment[2].join
  #       format_sentences << [top, mid, bot]
  #     end
  #     format_sentences.each do |sentence|
  #       sentence.each do |line|
  #         joined_sentences << line
  #       end
  #     end
  #     joined_sentences.each do |line|
  #       output_braille += "#{line}\n"
  #     end
  #   output_braille
  # end
end
