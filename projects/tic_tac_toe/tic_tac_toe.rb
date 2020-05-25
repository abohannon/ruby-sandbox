class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
    @player_state = Array.new(9, 0)
    @turn = :x
    @moves = 0
    @player_score_map = {
      0 => [0,3,6],
      1 => [0,4],
      2 => [0,5,7],
      3 => [1,3],
      4 => [1,4,8,6,7],
      5 => [1,5],
      6 => [2,3,7],
      7 => [2,4],
      8 => [2,5,6],
    }
    prompt()
  end

  private

  def prompt
    render_board()
    puts "Player #{@turn}'s turn."
    puts "Enter the index of your move."
    index = gets.chomp.to_i
    update_game_state(index)
  end

  def update_game_state(index)
    if index < 0 || index > 8
      puts "That's not a valid move. Try again."
    elsif @board[index] != ' '
      puts "That move is already taken. Try again."
    else
      update_board(index)
      update_score(index)
      @moves += 1
      game_over_check()
      change_turn()
    end

    prompt()
  end

  def update_board(index)
    @board[index] = @turn
  end

  def update_score(index)
    @player_score_map[index].each do |i|
      if (@turn == :x)
        @player_state[i] += 1
      elsif (@turn == :o)
        @player_state[i] -= 1
      end

      game_over_check(@player_state[i])
    end
  end

  def change_turn
    if @turn == :x
      @turn = :o
    elsif @turn == :o
      @turn = :x
    end
  end

  def game_over_check(score = nil)
    if score == 3
      puts
      puts '##############################'
      puts '####### Player X wins! #######'
      puts '##############################'
      puts
      render_board()
      reset_game()
    elsif score == -3
      puts
      puts '##############################'
      puts '####### Player O wins! #######'
      puts '##############################'
      puts
      render_board()
      reset_game()
    elsif @moves == 9
      puts
      puts '##############################'
      puts '######### STALEMATE! #########'
      puts '##############################'
      puts
      render_board()
      reset_game()
    end
  end

  def reset_game
    puts
    puts "Play again? (yes/no)"
    choice = gets.chomp

    if choice == 'yes'
      TicTacToe.new
    else
      exit
    end
  end

  def render_board
    puts
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts
  end
end

TicTacToe.new


