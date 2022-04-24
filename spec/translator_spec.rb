require 'simplecov'
SimpleCov.start

require './lib/translator'
require './lib/english_to_braille'

RSpec.describe Translator do

  it "exists" do
    text = "a"
    translator = Translator.new(text)

    expect(translator).to be_a(Translator)
  end

  it "has attributes" do
    text = "a"
    translator = Translator.new(text)

    expect(translator.text).to eq("a")
    expect(translator.dictionary).to be_a(Hash)
  end

  it "can convert 1 letter to braille" do
    text = "a"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."]])
  end

  it "can convert 2 letters to braille" do
    text = "az"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["0.", ".0", "00"]])
  end

  it "can check for spaces" do
    text = "a z"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["..", "..", ".."], ["0.", ".0", "00"]])
  end
end
