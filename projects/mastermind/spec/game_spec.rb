require "spec_helper"

module Mastermind
  RSpec.describe Board do
    let(:game) { Game.new(Codebreaker.new("Adam")) }

    context "#initialize" do
      it "initializes a game with a codebreaker and a board" do
        expect(game.codebreaker.name).to eq("Adam")
        expect(game.codebreaker.guesses.length).to eq(0)
        expect(game.board.rounds[0]).to eq({ guess: [], key: [] })
      end
    end
  end
end
