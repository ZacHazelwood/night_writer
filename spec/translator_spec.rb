require 'simplecov'
SimpleCov.start

require './lib/translator'
require './lib/english_to_braille'

RSpec.describe Translator do
  before :each do
    @dictionary = EnglishToBraille.new
    @translator = Translator.new("a", @dictionary)
  end
  it "exists" do

    expect(@translator).to be_a(Translator)
  end

  it "has attributes" do

    expect(@translator.text).to eq("a")
    expect(@translator.dictionary).to be_a(EnglishToBraille)
  end

end
