require "spec_helper"

module Mastermind
  RSpec.describe Board do
    context "#initialize" do
      it "initializes with an array of 9 rounds objects with 'guess' and 'key' keys" do
        board = Board.new
        expect(board.rounds.length).to eq(9)
        expect(board.rounds[0][:guess]).to be_a(Array)
        expect(board.rounds[0][:key]).to be_a(Array)
      end
    end
  end
end
