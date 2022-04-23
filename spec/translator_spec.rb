require 'simplecov'
SimpleCov.start

require './lib/translator'

RSpec.describe Translator do

  it "exists" do
    translator = Translator.new

    expect(translator).to be_a(Translator)
  end

end
