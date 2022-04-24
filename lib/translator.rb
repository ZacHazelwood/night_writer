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
    # require "pry"; binding.pry
    english_letters = @text.chars
    converted_braille = []
    (english_letters.count).times do |letter|
      converted_braille << @dictionary[english_letters.shift]
    end
    converted_braille
  end

  def arrange_braille
    # require "pry"; binding.pry
    translated_braille = self.convert_to_braille
    transposed_translated_braille = translated_braille.transpose
    top = transposed_translated_braille[0].join.to_s
    mid = transposed_translated_braille[1].join.to_s
    bot = transposed_translated_braille[2].join.to_s
    arranged_braille = "#{top}\n#{mid}\n#{bot}"
    arranged_braille
  end
end
