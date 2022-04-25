require 'simplecov'
SimpleCov.start

require './lib/english_to_braille'

RSpec.describe EnglishToBraille do
  # before :each do
  #   @dictionary = EnglishToBraille.new
  # end
  #
  # xit "exists" do
  #
  #   expect(@dictionary).to be_a(EnglishToBraille)
  # end
  #
  # xit "contains a hash of english letters to braille" do
  #
  #   expect(@dictionary.english_to_braille_hash).to be_a(Hash)
  #   expect(@dictionary.english_to_braille_hash["a"]).to eq(["0.", "..", ".."])
  #   expect(@dictionary.english_to_braille_hash[" "]).to eq(["..", "..", ".."])
  # end
  #
  # xit "converts to binary" do
  #
  #   expect(@dictionary.convert_letter_to_braille("v")).to eq(["0.", "0.", "00"])
  # end
  # 
  # it "contains a hash" do
  #
  #   expect(ENGLISH_TO_BRAILLE_HASH).to be_a(Hash)
  # end
end
