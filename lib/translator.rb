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
    text_length = @text.chars.length
    index_counter = 0
    english_letters = @text.chars
    converted_braille = []
    converted_braille_sentence = []
      # if text_length > 40
      #   until text_length == 0
      #     (english_letters.count).times do |letter|
      #       converted_braille << @dictionary[english_letters.shift]
      #       index_counter += 1
      #       text_length -= 1
      #       case #index_counter
      #       when index_counter == 40
      #         converted_braille_sentence << converted_braille
      #         converted_braille = []
      #         index_counter = 0
      #       end
      #     end
      #     break
      #   end
      # else
        (english_letters.count).times do |letter|
          converted_braille_sentence << @dictionary[english_letters.shift]
        end
    # end
    converted_braille_sentence.each_slice(40).to_a
  end

  # def convert_to_braille
  #   english_letters = @text.chars
  #   converted_braille = []
  #     (english_letters.count).times do |letter|
  #       converted_braille << @dictionary[english_letters.shift]
  #     end
  #   converted_braille
  # end

  def arrange_braille
    transposed_sentence = []
    format_sentences = []
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
      joined_sentences = []
      format_sentences
        format_sentences.each do |sentence|
          sentence.each do |line|
            joined_sentences << line
          end
        end
          joined_sentences
        output_braille = ""
        joined_sentences.each do |line|
          output_braille += "#{line}\n"
        end
        # require "pry"; binding.pry
        output_braille
    #   top = transposed_translated_braille[0].join.to_s
    #   mid = transposed_translated_braille[1].join.to_s
    #   bot = transposed_translated_braille[2].join.to_s
    #   arranged_braille = "#{top}\n#{mid}\n#{bot}\n"
    #   puts "\n"
    # arranged_braille
  end
#   def arrange_braille
# # require "pry"; binding.pry
#     translated_braille = self.convert_to_braille
#     transposed_translated_braille = translated_braille.transpose
#     top = transposed_translated_braille[0].join.to_s
#     mid = transposed_translated_braille[1].join.to_s
#     bot = transposed_translated_braille[2].join.to_s
#     arranged_braille = "#{top}\n#{mid}\n#{bot}"
#     arranged_braille
#   end
end
