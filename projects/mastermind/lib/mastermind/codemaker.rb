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

      # shuffle the key result so there's no pattern in the response
      key.shuffle!
    end
  end
end
