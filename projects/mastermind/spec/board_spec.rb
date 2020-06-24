require "spec_helper"

module Mastermind
  RSpec.describe Board do
    let(:board) { Board.new }

    context "#initialize" do
      it "initializes with an array of 1 round objects with 'guess' and 'key' keys" do
        expect(board.rounds.length).to eq(1)
        expect(board.rounds[0][:guess]).to be_a(Array)
        expect(board.rounds[0][:key]).to be_a(Array)
      end
    end

    context "#set_guess" do
      it "sets a guess for the correct round" do
        board.set_guess("hello world")
        expect(board.rounds[0][:guess]).to eq("hello world")
      end
    end

    context "#set_key" do
      it "sets a key for the correct round" do
        board.set_key("key test")
        expect(board.rounds[0][:key]).to eq("key test")
      end
    end

    context "#check_guess" do
      it "pushes :black into key array when a color is correct and in the correct index and pushed :white into key array when color is correct but not in the correct index" do
        allow(board).to receive(:code).and_return([:blue, :red, :red, :green])
        key = board.check_guess([:blue, :green, :red, :yellow])
        expect(key.count(:black)).to eq(2)
        expect(key.count(:white)).to eq(1)
      end
    end

    context "#next_round" do
      it "increments current_round and adds an empty round" do
        board.next_round
        # expect(board.current_round).to eq(1)
        puts board.rounds
        expect(board.rounds.length).to eq(2)
      end
    end

    context "#correct_guess?" do
      it "returns true if all keys are :black" do
        key = Array.new(4) { :black }
        expect(board.correct_guess?(key)).to eq(true)
      end

      it "returns false if the key array contains :white" do
        key = [:black, :white, :black, :black]
        expect(board.correct_guess?(key)).to eq(false)
      end
    end

    context "#game_over" do
      it "returns :winner if correct_guess? returns true" do
        key = Array.new(4) { :black }
        expect(board.game_over(key)).to eq(:winner)
      end

      it "returns :loser if current_round is larger than max rounds of 9 (indicating player did not guess the code correctly)" do
        allow(board).to receive(:current_round).and_return(10)
        expect(board.game_over).to eq(:loser)
      end
    end
  end
end
