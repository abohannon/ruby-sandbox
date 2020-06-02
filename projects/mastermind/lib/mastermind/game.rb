module Mastermind
  class Game
    attr_reader :codebreaker, :board

    def initialize(codebreaker, board = Board.new)
      @codebreaker = codebreaker
      @board = board
    end

    def solicit_guess
      puts ""
      puts "#{codebreaker.name}: What's your guess?"
      puts "Options: red, blue, yellow, green, white, or black"
      puts ""
    end

    def get_guess(guess = gets.chomp)
      board.set_guess(guess)
    end

    def play
      puts ""
      puts "Welcome to Mastermind. The Codemaker has selected a secret code of 4 colors."
      puts ""

      while true
        board.formatted_board
        solicit_guess
        guess = get_guess
        keys = board.check_guess(guess)
        board.set_key(key)
        # TODO: continue here

      end
    end
  end

  def game_over_message

  end
end
