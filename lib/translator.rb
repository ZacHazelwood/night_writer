class Translator

  attr_reader :text,
              :dictionary

  def initialize(text, dictionary)
    @text = text
    @dictionary = dictionary
  end
end
