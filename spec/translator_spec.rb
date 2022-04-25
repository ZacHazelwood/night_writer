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

    expect(translator.convert_to_braille).to eq([[["0.", "..", ".."]]])
  end

  it "can convert 2 letters to braille" do
    text = "az"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([[["0.", "..", ".."], ["0.", ".0", "00"]]])
  end

  it "can check for spaces" do
    text = "a z"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([[["0.", "..", ".."], ["..", "..", ".."], ["0.", ".0", "00"]]])
  end

  it "can arrange 1 braille letter vertically" do
    text = "a"
    translator = Translator.new(text)

    expected = "0.\n..\n..\n"

    expect(translator.arrange_braille).to eq(expected)
  end

  it "can arrange multiple braille letters vertically" do
    text = "aaaa"
    translator = Translator.new(text)

    expected = "0.0.0.0.\n........\n........\n"

    expect(translator.arrange_braille).to eq(expected)
  end

  it "can add a line break after 40 characters" do
    text = "abcdefghi abcdefghi abcdefghi abcdefghi abcd"
    translator = Translator.new(text)

    expected = "0.0.00000.00000..0..0.0.00000.00000..0..0.0.00000.00000..0..0.0.00000.00000..0..\n..0....0.00.00000.....0....0.00.00000.....0....0.00.00000.....0....0.00.00000...\n................................................................................\n0.0.0000\n..0....0\n........\n"

    expect(translator.arrange_braille).to eq(expected)
  end
end
