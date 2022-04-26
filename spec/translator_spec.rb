require 'simplecov'
SimpleCov.start

require './lib/translator'

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

  end

  it "cannot read special characters" do
    text = "!"
    translator = Translator.new(text)

    expect(translator.convert_to_braille).to eq([[nil]])

    text2 = "a!"
    translator2 = Translator.new(text2)
    expect(translator2.convert_to_braille).to eq([[["0.", "..", ".."], nil]])
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

describe "Helper methods" do
  before :each do
    @text = "this is a sentence with at least forty characters"
    @translator = Translator.new(@text)
  end

  it "transposes the converted braille characters" do

    expect(@translator.transpose_conversion).to be_a(Array)
  end

  it "formats the transposed conversion into braille lines" do

    expect(@translator.format_into_sentences).to be_a(Array)
  end

  it "joins sentences into a single Array" do

    expect(@translator.join_sentences).to be_a(Array)
    expect(@translator.join_sentences.length).to eq(6)
  end
end
