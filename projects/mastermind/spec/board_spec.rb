require "spec_helper"

module Mastermind
  RSpec.describe Board do
    let(:board) { Board.new }

    context "#initialize" do
      it "initializes with an array of 9 rounds objects with 'guess' and 'key' keys" do
        expect(board.rounds.length).to eq(9)
        expect(board.rounds[0][:guess]).to be_a(Array)
        expect(board.rounds[0][:key]).to be_a(Array)
      end
    end

    context "#set_guess" do
      it "sets a guess for the correct round" do
        board.set_guess(1, "hello world")
        expect(board.rounds[0][:guess]).to eq("hello world")
      end
    end

    context "#set_key" do
      it "sets a key for the correct round" do
        board.set_key(2, "key test")
        expect(board.rounds[1][:key]).to eq("key test")
      end
    end
  end
end
