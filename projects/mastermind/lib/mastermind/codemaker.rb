module Mastermind
  class Codemaker
    attr_reader :code

    def initialize
      colors = %i[red blue yellow green white black]
      @code = 4.times.map { colors.sample }
    end
  end
end
