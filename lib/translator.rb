require './lib/english_to_braille'

class Translator
  include EnglishToBraille

  attr_reader :text,
              :dictionary

  def initialize(text)
    @text = text
    @dictionary = ENGLISH_TO_BRAILLE_HASH
  end

  def convert_to_braille
    # require "pry"; binding.pry
    english_letters = @text.chars
    converted_braille = []
    (english_letters.count).times do |letter|
      converted_braille << @dictionary[english_letters.shift]
    end
      converted_braille
  end

  def arrange_braille(converted_braille)

  end
end
