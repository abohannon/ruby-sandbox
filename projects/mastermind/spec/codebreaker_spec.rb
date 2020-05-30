require "spec_helper"

module Mastermind
  RSpec.describe Codebreaker do
    context "#initialize" do
      it "initializes the Codebreaker without error" do
        expect { Codebreaker.new('Adam') }.to_not raise_error
      end
    end

    it "initializes the Codebreaker with the name of the player and an empty array of guesses" do
      codebreaker = Codebreaker.new('Adam')
      expect(codebreaker.name).to eq('Adam')
      expect(codebreaker.guesses).to be_a(Array)
      expect(codebreaker.guesses.length).to eq(0)
    end
  end
end
