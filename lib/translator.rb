require './lib/english_to_braille'

class Translator
  include EnglishToBraille

  attr_reader :text,
              :dictionary

  def initialize(text)
    @text = text.delete("\n")
    @dictionary = ENGLISH_TO_BRAILLE_HASH
  end

  def arrange_braille
    output_braille = ""
      join_sentences.each do |line|
        output_braille += "#{line}\n"
      end
    output_braille
  end

# Helper methods for #arrange_braille

  def convert_to_braille
    english_letters = @text.downcase.chars
    converted_braille = []
    (english_letters.count).times do |letter|
      converted_braille << @dictionary[english_letters.shift]
    end
    converted_braille.each_slice(40).to_a
  end

  def transpose_conversion
    transposed_sentence = []
    translated_braille = self.convert_to_braille
    translated_braille.each do |sentence|
      transposed_sentence << sentence.transpose
    end
    transposed_sentence
  end

  def format_into_sentences
    format_sentences = []
    transpose_conversion.map do |segment|
      top = segment[0].join
      mid = segment[1].join
      bot = segment[2].join
      format_sentences << [top, mid, bot]
    end
    format_sentences
  end

  def join_sentences
    joined_sentences = []
    format_into_sentences.each do |sentence|
      sentence.each do |line|
        joined_sentences << line
      end
    end
    joined_sentences
  end
end
