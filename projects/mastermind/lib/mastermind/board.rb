module Mastermind
  class Board
    attr_reader :code
    attr_accessor :current_round, :rounds

    def initialize(code = Codemaker.new.code)
      @rounds = default_rounds
      @code = code
      @current_round = 0
    end

    def formatted_board
      rounds.each_with_index do |round, index|
        puts ""
        puts "#{index + 1} | Guess: #{round[:guess]} | Keys: #{round[:key]}"
        puts ""
      end
    end

    def set_guess(guess)
      rounds[current_round][:guess] = guess
      guess
    end

    def set_key(key)
      rounds[current_round][:key] = key
    end

    def check_guess(guess)
      key = []
      guess.each_with_index do |color, i|
        if code[i] == color
          key << :black
        elsif code.include?(color)
          key << :white
        end
      end

      # shuffle the key result so there's no pattern in the response
      key.shuffle!
    end

    def next_round
      self.current_round += 1
      rounds << { guess: [], key: [] }
    end

    def correct_guess?(key)
      key.length == 4 && key.all? { |color| color == :black }
    end

    def game_over(key = [])
      return :winner if correct_guess?(key)
      return :loser if current_round > 9
      return false
    end

    private

    def default_rounds
      Array.new(1) { { guess: [], key: [] } }
    end
  end
end
