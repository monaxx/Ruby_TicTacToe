require 'pry-byebug'
require_relative 'player'
class TicTacToe
  WINNING_COMBS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                   [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Array.new(3) { Array.new(3, '_') }
    @player1 = Player.new(marker: 'X', name: 'Player 1')
    @player2 = Player.new(marker: '0', name: 'Player 2')
    @number_of_turns = 0
    @no_winner = true
    show_board
  end

  def increment_num_of_turns
    @number_of_turns += 1
  end

  def start_game
    loop do
      current_player = switch_player
      current_player.markboard(@board)
      show_board
      if winner?(current_player.marker)
        declare_winner(current_player)
        break
      end
    end
  end

  def board=(row_col_value)
    @board[row_col_value[:row]][row_col_value[:col]] = row_col_value[:value]
  end

  def board(row, col)
    @board[row][col]
  end

  private

  def declare_winner(current_player)
    puts "#{current_player.name} wins!"
  end

  def switch_player
    increment_num_of_turns
    if (@number_of_turns % 2).zero?
      puts @player2.name
      @player2
    else
      puts @player1.name
      @player1
    end
  end

  def winner?(player_marker)
    flat_board = @board.flatten
    WINNING_COMBS.one? { |arr|
      (flat_board[arr[0]] == flat_board[arr[1]] && flat_board[arr[1]] == flat_board[arr[2]] && flat_board[arr[0]] != '_')
    }
  end

  def show_board
    puts '  0 1 2'
    3.times do |i|
      print "#{i} "
      3.times do |j|
        print "#{@board[i][j]} "
      end
      print "\n"
    end
    print "\n"
  end
end

game = TicTacToe.new
game.start_game
