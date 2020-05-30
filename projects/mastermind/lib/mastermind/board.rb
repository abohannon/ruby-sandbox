module Mastermind
  class Board
    attr_reader :rounds

    def initialize
      @rounds = default_rounds
    end

    def formatted_board
      rounds.each_with_index do |round, index|
        puts ""
        puts "#{index + 1} | Guess: #{round[:guess]} | Keys: #{round[:key]}"
        puts ""
      end
    end

    def set_guess(round, guess)

    end

    private

    def default_rounds
      Array.new(9) { { guess: [], key: [] } }
    end
  end
end