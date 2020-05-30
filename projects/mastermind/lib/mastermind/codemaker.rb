module Mastermind
  class Codemaker
    attr_reader :code

    def initialize
      colors = %i[red blue yellow green white black]
      @code = 4.times.map { colors.sample }
    end

    def check_guess(guess)
      key = []

      guess.each_with_index do |color, i|
        if code[i] == color
          key << :black
        elsif code.include?(color.to_sym)
          key << :white
        end
      end

      key
    end
  end
end
