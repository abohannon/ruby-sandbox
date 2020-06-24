module Mastermind
  class Game
    attr_reader :codebreaker, :board

    def initialize(codebreaker, board = Board.new)
      @codebreaker = codebreaker
      @board = board
    end

    def solicit_guess
      puts ""
      puts "#{codebreaker.name}: What's your guess? Pick 4 colors."
      puts "Options: red, blue, yellow, green, white, or black"
      puts ""
    end

    def get_guess(guess = gets.chomp)
      symbolized_guess = guess.split(', ').map(&:to_sym)

      if symbolized_guess.length > 4
        puts "Too many guesses. Only 4 permitted. Try again."
        puts ""
        get_guess
      else
        board.set_guess(symbolized_guess)
      end
    end

    def game_over_message(key)
      return "#{codebreaker.name} has broken the code!" if board.game_over(key) == :winner
      return "#{codebreaker.name} failed to break the code. The code was #{board.code}. Try again." if board.game_over(key) == :loser
    end

    def play
      puts ""
      puts "Welcome to Mastermind. The Codemaker has selected a secret code of 4 colors."
      puts ""
      while true
        board.formatted_board
        solicit_guess
        guess = get_guess
        key = board.check_guess(guess)
        board.set_key(key)
        if board.game_over(key)
          puts game_over_message(key)
          board.formatted_board
          return
        else
          puts "Good guess. Try again."
          board.next_round
        end
      end
    end
  end
end
