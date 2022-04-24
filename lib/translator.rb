require './lib/english_to_braille'

class Translator
  include EnglishToBraille

  attr_reader :text,
              :dictionary

  def initialize(text)
    @text = text
    @dictionary = dictionary
  end

  def convert_to_braille
    # require "pry"; binding.pry
    english_letters = @text.chars
    converted_braille = []
    (english_letters.count).times do |letter|
      converted_braille << ENGLISH_TO_BRAILLE_HASH[english_letters.shift]
    end
      converted_braille
  end
end
