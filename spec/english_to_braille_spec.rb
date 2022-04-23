require 'simplecov'
SimpleCov.start

require './lib/english_to_braille'

RSpec.describe EnglishToBraille do

  it "exists" do
    dictionary = EnglishToBraille.new

    expect(dictionary).to be_a(EnglishToBraille)
  end

  it "is a hash containing the alphabet" do
    dictionary = EnglishToBraille.new
# require "pry"; binding.pry
    expect(dictionary.braille_from_english).to be_a(Hash)
    expect(dictionary.braille_from_english["a"]).to eq(["0.", "..", ".."])
  end

  it "assigns braille from an english character" do
    dictionary = EnglishToBraille.new

    expect(dictionary.english_to_braille("u")).to eq(["0.", "..", "00"])
    expect(dictionary.english_to_braille("j")).to eq([".0", "00", ".."])
  end
end
