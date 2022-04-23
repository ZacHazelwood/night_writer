require 'simplecov'
SimpleCov.start

require './lib/translator'
require './lib/english_to_braille'

RSpec.describe Translator do
  # before :each do
  #   @dictionary = EnglishToBraille.new
  #   @translator = Translator.new("a", @dictionary)
  # end
  xit "exists" do

    expect(@translator).to be_a(Translator)
  end

  xit "has attributes" do

    expect(@translator.text).to eq("a")
    expect(@translator.dictionary).to be_a(EnglishToBraille)
  end

# Refactor tests for testing

  it "can convert 1 letter to braille" do
    translator = Translator.new("a")

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."]])
  end

  it "can convert 2 letters to braille" do
    translator = Translator.new("az")

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["0.", ".0", "00"]])
  end

  it "can check for spaces" do
    translator = Translator.new("a z")

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["..", "..", ".."], ["0.", ".0", "00"]])
  end

end
