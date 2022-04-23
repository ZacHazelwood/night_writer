require 'simplecov'
SimpleCov.start

require './lib/english_to_braille'

RSpec.describe EnglishToBraille do

  it "exists" do
    dictionary = EnglishToBraille.new

    expect(dictionary).to be_a(EnglishToBraille)
  end

end
