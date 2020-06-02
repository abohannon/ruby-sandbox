module Mastermind
  class Codebreaker
    attr_reader :name, :guesses

    def initialize(name)
      @name = name
      @guesses = []
    end

    def make_guess(guess)
      @guesses << guess
      guess
    end
  end
end
