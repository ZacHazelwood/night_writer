require 'simplecov'
SimpleCov.start

require './lib/translator'
require './lib/english_to_braille'

RSpec.describe Translator do

  xit "exists" do
    text = "a"
    translator = Translator.new(text)

    expect(translator).to be_a(Translator)
  end

  xit "has attributes" do
    text = "a"
    translator = Translator.new(text)

    expect(translator.text).to eq("a")
    expect(translator.dictionary).to be_a(Hash)
  end

  xit "can convert 1 letter to braille" do
    text = "a"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."]])
  end

  xit "can convert 2 letters to braille" do
    text = "az"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["0.", ".0", "00"]])
  end

  xit "can check for spaces" do
    text = "a z"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([["0.", "..", ".."], ["..", "..", ".."], ["0.", ".0", "00"]])
  end

  xit "can arrange 1 braille letter vertically" do
    text = "a"
    translator = Translator.new(text)

    expected = "0.\n..\n.."

    expect(translator.arrange_braille).to eq(expected)
  end

  xit "can arrange multiple braille letters vertially" do
    text = "aaaa"
    translator = Translator.new(text)

    expected = "0.0.0.0.\n........\n......"

    expect(translator.arrange_braille).to eq(expected)
  end

  it "can add a line break after 40 characters" do
    text = "abcdefghi abcdefghi abcdefghi abcdefghi a"
    translator = Translator.new(text)

    expected = ""

    expect(translator.arrange_braille).to eq(expected)
  end
end
