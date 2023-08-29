class Player
  attr_accessor :score
  attr_reader :marker, :name

  def initialize(score: 0, marker: 'X', name: 'Player 1')
    @score = score
    @marker = marker
    @name = "#{name} - \"#{marker}\""
  end

  def markboard(gameboard)
    loop do
      coordinate = player_input
      if gameboard[coordinate[0]][coordinate[1]] == '_'
        gameboard[coordinate[0]][coordinate[1]] = @marker
        break
      else
        puts 'Coordinate filled. Enter another coordinate'
      end
    end
  end

  private

  def player_input
    puts 'Enter coordinates(row col): '
    begin
      player_input = gets.match(/[0-2] [0-2]/)[0]
    rescue
      puts 'WARNING: Invalid input. Valid input are 2 values from 0-2 with space between the two numbers
      wherein the first number is row, then column next (Ex. 2 1)'
      retry
    end
    player_input.split(' ').map(&:to_i)
  end
end
