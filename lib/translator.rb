require './lib/english_to_braille'

class Translator
  include EnglishToBraille

  attr_reader :text,
              :dictionary

  # def initialize(text, dictionary)
  #   @text = text
  #   @dictionary = dictionary
  # end

  def initialize(test)
    @test = test
    @converted_braille = []
  end

  def convert_to_braille
    english_letters = @test.chars
    (english_letters.count).times do |letter|
      @converted_braille << english_to_braille_hash[english_letters.shift]
    end
      @converted_braille
  end
end
