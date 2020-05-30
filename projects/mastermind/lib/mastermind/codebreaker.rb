module Mastermind
  class Codebreaker
    attr_reader :name, :guesses

    def initialize(name)
      @name = name
      @guesses = []
    end

    def make_guess(colors)
      @guesses << colors
      colors
    end
  end
end
