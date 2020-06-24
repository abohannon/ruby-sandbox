require_relative "../lib/mastermind.rb"

codebreaker = Mastermind::Codebreaker.new("Adam")
Mastermind::Game.new(codebreaker).play
