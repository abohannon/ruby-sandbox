require "spec_helper"

module Mastermind
  RSpec.describe Codemaker do
    let(:codemaker) { Codemaker.new }

    context "#initialize" do
      it "initializes the Codemaker with an array of 4 random colors" do
        expect(codemaker.code).to be_a(Array)
        expect(codemaker.code.length).to eq(4)
        expect(codemaker.code[0]).to be_a(Symbol)
        expect(codemaker.code[1]).to be_a(Symbol)
        expect(codemaker.code[2]).to be_a(Symbol)
        expect(codemaker.code[3]).to be_a(Symbol)
      end
    end
  end
end
