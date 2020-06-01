module Mastermind
  class Game
    attr_reader :codebreaker, :board

    def initialize(codebreaker, board = Board.new)
      @codebreaker = codebreaker
      @board = board
    end

    def play
    end
  end
end
