require 'simplecov'
SimpleCov.start

require './lib/english_to_braille'

RSpec.describe EnglishToBraille do
  before :each do
    @dictionary = EnglishToBraille.new
  end

  it "exists" do

    expect(@dictionary).to be_a(EnglishToBraille)
  end

  it "contains a hash of english letters to braille" do

    expect(@dictionary.english_to_braille_hash).to be_a(Hash)
    expect(@dictionary.english_to_braille_hash["a"]).to eq(["0.", "..", ".."])
    expect(@dictionary.english_to_braille_hash[" "]).to eq(["..", "..", ".."])
  end

end
